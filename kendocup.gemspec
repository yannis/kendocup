$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kendocup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kendocup"
  s.version     = Kendocup::VERSION
  s.authors     = ["Yannis Jaquet"]
  s.email       = ["yannisjaquet@mac.com"]
  s.homepage    = "http://github.com/yannis/kendocup"
  s.summary     = "Kendo tournament rails engine"
  s.description = "Kendo tournament rails engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'activeadmin', "~> 1.3.0"
  s.add_dependency "rails", "~> 4.2.8"
  s.add_dependency "sass-rails"
  # s.add_dependency "meta_search", '>= 1.1.0.pre'
  s.add_dependency "figaro"
  s.add_dependency 'haml-rails'
  s.add_dependency 'prawn'
  s.add_dependency 'prawn-table'

  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "pg"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'byebug'
end
