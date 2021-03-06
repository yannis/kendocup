ActiveAdmin.register Kendocup::Cup, as: "Cup" do

  permit_params :year, :start_on, :end_on, :deadline, :adult_fees_chf, :adult_fees_eur, :junior_fees_chf, :junior_fees_eur

  # controller do
  #   before_filter :set_cup, only: [:show, :edit, :update, :delete]

  #   def set_cup
  #     @cup = Kendocup::Cup.where("extract(year from cups.start_on) = ?", params[:id]).first
  #   end
  # end

  controller do
    def find_resource
      Kendocup::Cup.where(year: params[:id]).first!
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Details" do
      f.input :start_on, as: :datepicker
      f.input :end_on, as: :datepicker
      f.input :deadline, as: :datepicker
    end
    f.inputs "Fees" do
      f.input :adult_fees_chf
      f.input :adult_fees_eur
      f.input :junior_fees_chf
      f.input :junior_fees_eur
    end
    f.actions
  end


  index do
    column :year
    column :start_on
    column :end_on
    column :deadline
    column :adult_fees_chf
    column :adult_fees_eur
    column :junior_fees_chf
    column :junior_fees_eur
    actions
  end

  show title: proc{|cup| cup.year} do |cup|
    attributes_table do
      row :start_on
      row :end_on
      row :deadline
      row :adult_fees_chf
      row :adult_fees_eur
      row :junior_fees_chf
      row :junior_fees_eur
    end
    if cup.kenshis.present?
      panel "Kenshis" do
        table do
          thead do
            tr do
              th do
                "Last name"
              end
              th do
                "First name"
              end
              cup.team_categories.each do |tc|
                th do
                  tc.name
                end
              end
              cup.individual_categories.each do |ic|
                th do
                  ic.name
                end
              end
              cup.products.each do |p|
                th do
                  p.name
                end
              end
            end
          end
          tbody do
            cup.kenshis.order(:last_name, :first_name).each do |kenshi|
              tr do
                td do
                  kenshi.norm_last_name
                end
                td do
                  kenshi.norm_first_name
                end
                cup.team_categories.each do |tc|
                  td do
                    tc.name if kenshi.takes_part_to? tc
                  end
                end
                cup.individual_categories.each do |ic|
                  td do
                    ic.name if kenshi.takes_part_to? ic
                  end
                end
                cup.products.each do |p|
                  td do
                    p.name if kenshi.consume? p
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  filter :year

  # form do |f|
  #   f.inputs "Details" do
  #     f.input :start_on, as: :string, input_html: {class: "hasDatetimePicker"}
  #     f.input :end_on, as: :string, input_html: {class: "hasDatetimePicker"}
  #     f.input :deadline, as: :string, input_html: {class: "hasDatetimePicker"}
  #     f.input :adult_fees_chf
  #     f.input :adult_fees_eur
  #     f.input :junior_fees_chf
  #     f.input :junior_fees_eur
  #   end
  #   f.actions
  # end

  member_action :download_kenshi_list, method: :get do
    @cup = Kendocup::Cup.all.detect{|c| c.year.to_i == params[:id].to_i}
    kenshis = @cup.kenshis
    csv = CSV.generate do |csv|
      header = ["Last name", "First name", "Club", "Dob", "Grade"]
      [@cup.team_categories, @cup.individual_categories, @cup.products].flatten.each do |tc|
        header << tc.name
      end
      header += ["Competition fee (CHF)", "Competition fee (€)", "Product fee (CHF)", "Product fee (€)", "Total fee (CHF)", "Total fee (€)"]
      csv << header.flatten
      kenshis.each do |kenshi|
        kcsv = [ kenshi.norm_last_name, kenshi.norm_first_name, kenshi.club.name, kenshi.dob, kenshi.grade]
        @cup.team_categories.each do |tc|
          kcsv << (kenshi.takes_part_to?(tc) ? kenshi.participations.to(tc).first.team : nil)
        end
        @cup.individual_categories.each do |ic|
          kcsv << (kenshi.takes_part_to?(ic) ? ic.name : nil)
        end
        @cup.products.each do |p|
          kcsv << (kenshi.consume?(p) ? p.name : nil)
        end
        kcsv += [kenshi.competition_fee(:chf), kenshi.competition_fee(:eur), kenshi.competition_fee(:chf), kenshi.competition_fee(:eur), kenshi.fees(:chf), kenshi.fees(:eur) ]
        csv << kcsv.flatten
      end
    end

    send_data csv, type: 'text/csv; charset=utf-8; header=present', disposition: "attachment; filename=cup_#{@cup.year}_kenshis_list_#{Time.current.to_s(:flat)}.csv"

  end

  action_item :kenshi_list, only: :show do
    link_to('Kenshis list', params.merge(action: :download_kenshi_list))
  end

end
