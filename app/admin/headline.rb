ActiveAdmin.register Kendocup::Headline, as: "Headline" do


  permit_params :title_en, :title_fr, :content_fr, :content_en, :shown, :cup_id

  controller do
    def authenticate_admin_user!
      redirect_to root_url unless current_user.try(:admin?)
    end
  end

  index do
    column :cup
    column :title_en
    column :title_fr
    column :content_en
    column :content_fr
    column :shown
    actions
  end

  show title: proc{|event| event.title} do |event|
    attributes_table do
      row :cup
      row :title_en
      row :title_fr
      row :content_en
      row :content_fr
      row :shown
    end
  end

  filter :cup
  filter :title_fr
  filter :title_en
  filter :shown

  form do |f|
    f.inputs "Details" do
      f.input :cup
      f.input :title_en
      f.input :title_fr
      f.input :content_en
      f.input :content_fr
      f.input :shown
    end
    f.actions
  end
end
