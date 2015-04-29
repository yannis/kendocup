ActiveAdmin.register Kendocup::Club, as: "Club" do

  permit_params :name

  controller do
    def authenticate_admin_user!
      redirect_to root_url unless current_user.try(:admin?)
    end
  end
end
