require 'activeadmin'
module Kendocup
  class Engine < ::Rails::Engine
    isolate_namespace Kendocup

    initializer :kendocup do |app|
      ActiveAdmin.application.load_paths << File.join(config.root, 'lib/kendocup/admin')
    end

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
