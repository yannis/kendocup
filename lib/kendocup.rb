require "kendocup/engine"
require 'devise'

module Kendocup

  def self.table_name_prefix
    'kendocup_'
  end
end


# module MyEngine
#   class Engine < ::Rails::Engine
#     config.to_prepare do
#       Devise::SessionsController.layout "layout_for_sessions_controller"
#     end
#   end
# end
