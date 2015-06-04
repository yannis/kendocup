require 'cancancan'
module Kendocup
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_filter :set_current_cup
    before_filter :store_location_if_html, :only => [:index, :show]

    # restrict access to admin module for non-admin users
    def authenticate_admin_user!
      raise "Implement me in your own ApplicationController"
      # redirect_to root_url unless current_user.try(:admin?)
    end

    def back
      redirect_back_or_default
    end

    def redirect_back_or_default(default=root_path, options={})
      redirect_to(session[:return_to] || default, options)
      session[:return_to] = nil
    end


  protected

    # def current_user_admin?
    #   user_signed_in? && current_user.admin?
    # end

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
