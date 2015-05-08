require 'cancancan'
module Kendocup
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?
    before_filter :set_current_cup
    before_filter :store_location_if_html, :only => [:index, :show]

    rescue_from CanCan::AccessDenied do |exception|
      # Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
      if current_user.present?
        redirect_to root_path, alert: exception.message, status: 401
      else
        redirect_to new_user_session_path, alert: I18n.t("devise.failure.unauthenticated")
      end
    end

    def current_ability
      @current_ability ||= KendocupAbility.new(current_user)
    end


    # restrict access to admin module for non-admin users
    def authenticate_admin_user!
      redirect_to root_url unless current_user.try(:admin?)
    end

    def back
      redirect_back_or_default
    end

    def redirect_back_or_default(default=root_path, options={})
      redirect_to(session[:return_to] || default, options)
      session[:return_to] = nil
    end

  protected

    def configure_permitted_parameters
      unless current_user_admin?
        devise_parameter_sanitizer.for(:sign_up) << :admin
      end
    end

    def current_user_admin?
      user_signed_in? && current_user.admin?
    end

    def set_current_cup
      unless @current_cup.present?
        future_cups = Cup.future.order("cups.start_on ASC")
        past_cups = Cup.past.order("cups.start_on DESC")
        if future_cups.present?
          @current_cup = future_cups.first
        elsif past_cups.present?
          @current_cup = past_cups.first
        else
          raise "Cup is missing!!!"
        end
      end
    end

    def check_deadline
      set_current_cup
      if !current_user.admin? && Time.current > @current_cup.deadline
        redirect_back_or_default root_path, alert:  t('kenshis.deadline_passed', email: 'info@kendo-geneve.ch')
        return
      end
    end
  end
end
