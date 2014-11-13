
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
# require 'rspec/autorun'
require 'shoulda/matchers'
require 'factory_girl_rails'
require 'rspec/active_model/mocks'
require 'faker'
require 'timecop'
Rails.backtrace_cleaner.remove_silencers!
# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }



# ActiveRecord::Migration.maintain_test_schema! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.mock_with :rspec
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.run_all_when_everything_filtered = true
  config.filter_run :focus


  config.before(:each) { @routes = Kendocup::Engine.routes }

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!


  def should_be_asked_to_sign_in
    it {response.should redirect_to(new_user_session_path)}
    it {flash[:alert].should =~ /Vous devez vous connecter ou vous inscrire pour continuer/}
  end

  def should_not_be_authorized
    it {expect(response.status).to eq 401}
    it {expect(flash[:alert]).to match /You are not authorized to access this page/ }
  end

  def deadline_passed
    it {response.should redirect_to root_path(locale: I18n.locale)}
    it {flash[:alert].should eq I18n.t("kenshis.deadline_passed", email: 'info@kendo-geneve.ch')}
  end

end

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!
