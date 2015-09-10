require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'webmock'
require 'vcr'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock # after VCR records the response, stub the info
  end

  def create_user!
    user = User.create!( name: "Adam",
                        image: "http://asdf.com",
                          bio: "asdf",
                      website: "whatever.com",
                        token: Figaro.env.APP_OWNER_IG_TOKEN,
                     provider: "Instagram",
                          uid: "10")
    user
  end

end
