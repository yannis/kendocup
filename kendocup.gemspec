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
  s.summary     = "Kendo tournament functionality"
  s.description = "Kendo tournament functionality"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.7"
  s.add_dependency "sass-rails", "~> 4.0.4"
  s.add_dependency 'devise'
  s.add_dependency 'cancancan'
  s.add_dependency 'haml-rails'
  s.add_dependency 'omniauth-twitter'
  s.add_dependency 'omniauth-facebook'
  s.add_dependency 'omniauth-github'
  s.add_dependency 'omniauth-google'
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
end
