class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    Kendocup::User.first || Kendocup::User.create(first_name: 'Dummy', last_name: 'Dummy', admin: true)
  end

  def authenticate_admin_user!
    Rails.logger.debug "authenticate_admin_user called"
    redirect_to root_url unless current_user.try(:admin?)
  end

end
