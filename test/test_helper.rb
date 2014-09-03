ENV['RAILS_ENV'] ||= 'test'
require 'i18n'
require 'active_model'
require 'minitest/autorun'
require File.expand_path('../../app/models/person', __FILE__)
Dir.glob('./lib/*.rb').each { |file| require file}
I18n.load_path += Dir[Dir.pwd + '/config/locales/app.pt-BR.yml']
I18n.locale = 'pt-BR'
require 'bundler/setup' # Set up gems listed in the Gemfile.
Bundler.require

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end