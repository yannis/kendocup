ActiveAdmin.register Kendocup::Event, as: "Event" do

  permit_params :cup_id, :name_en, :name_fr, :name_de, :start_on, :duration

  controller do
    def authenticate_admin_user!
      redirect_to root_url unless current_user.try(:admin?)
    end
  end

  index do
    column :cup
    column :name_en
    column :name_fr
    column :name_de
    column :start_on
    column :duration
    actions
  end

  filter :name_en
  filter :name_fr
  filter :name_de
  filter :cup

  form do |f|
    f.inputs "Details" do
      f.input :cup
      f.input :name_en
      f.input :name_fr
      f.input :name_de
      f.input :start_on, as: :string, input_html: {class: "hasDatetimePicker"}
      f.input :duration
    end
    f.actions
  end

end
