require_dependency "kendocup/application_controller"

module Kendocup
  class CupsController < ApplicationController

    def show
      @grouped_events = @cup.events.order(:start_on).group_by{|e| e.start_on.to_date}
      @headline = @cup.headlines.shown.order("kendo_cup.headlines.created_at DESC").first
    end
  end
end
