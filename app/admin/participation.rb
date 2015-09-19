ActiveAdmin.register Kendocup::Participation, as: "Participation" do

  permit_params :category_id, :category_type, :team_id, :pool_number, :pool_position, :ronin, :category_individual, :category_team

  controller do
    def authenticate_admin_user!
      redirect_to root_url unless current_user.try(:admin?)
    end

    def edit
      participation = Kendocup::Participation.find(params[:id])
      @page_title = "Edit participation of #{participation.kenshi.full_name} to category #{participation.category.name} (#{participation.category.year})"
    end
  end

  index do
    column :kenshi
    column :category
    column :team
    column :pool_number
    column :pool_position
    column :ronin
    column :rank
    actions
  end

  show title: proc{|participation| "Participation of #{participation.kenshi.full_name} to category #{participation.category.name} (#{participation.category.year})"} do
    attributes_table do
      row :kenshi
      row :category
      row :team
      row :pool_number
      row :pool_position
      row :ronin
      row :rank
    end
  end

  form do |f|
    f.object.errors
    f.semantic_errors *f.object.errors.keys
    f.inputs "Participation details" do
      # f.input :kenshi
      if f.object.category.is_a?(Kendocup::IndividualCategory)
        # f.input :category_individual, collection: Kendocup::IndividualCategory.where(cup: f.object.kenshi.cup).map{|c| ["#{c.name} (#{c.cup.year})", c.id]}
        f.input :pool_number
        f.input :pool_position
        f.input :rank
      else
        f.input :category_team, collection: Kendocup::TeamCategory.all.map{|c| ["#{c.name} (#{c.cup.year})", c.id]}
        f.input :ronin
        f.input :team
      end
    end

    f.actions
  end
end
