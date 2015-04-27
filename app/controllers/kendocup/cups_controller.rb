require_dependency "kendocup/application_controller"

module Kendocup
  class CupsController < ApplicationController

    skip_before_filter :set_cup, only: [:show]

    respond_to :html

    def index
      @cups = Cup.all
    end

    def show
      @cup = Cup.where("extract(year from cups.start_on) = ?", params[:id]).first
      if @cup.nil?
        set_cup
        redirect_to @cup
      else
        @grouped_events = @cup.events.order(:start_on).group_by{|e| e.start_on.to_date}
        @headline = @cup.headlines.shown.order("headlines.created_at DESC").first
        respond_with @cup do |format|
          format.html {
            if @cup.past?
              render "show_past"
            else
              render "show"
            end
          }
        end
      end
    end
  end
end
