require 'spec_helper'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'view_component/test_helpers'
require 'webdrivers'
require 'capybara/rails'

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

RSpec.configure do |config|
  config.use_active_record = false

  config.include ViewComponent::TestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component

  config.before :suite do
    Capybara.server = :puma
  end

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
