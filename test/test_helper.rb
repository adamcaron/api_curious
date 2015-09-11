require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require 'webmock'
require 'vcr'
require 'database_cleaner'

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

DatabaseCleaner.strategy = :transaction
DatabaseCleaner.start

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock # after VCR records the response, stub the info
  end

  def stub_user_data!
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new(
      {
        "provider"    => "instagram",
        "uid"         => "1644186282",
        "info"        => {
          "nickname"    => "adamcaron_",
          "name"        => "Adam Caron",
          "image"       => "https://igcdn-photos-a-a.akamaihd.net/hphotos-ak-xaf1/t51.2885-19/s150x150/11326500_497479217082584_1106824622_a.jpg",
          "bio"         => "NH🍁 -> CO🌲",
          "website"     => ""
        },
        "credentials" => {
          "token"       => Figaro.env.APP_OWNER_IG_TOKEN,
          "expires"     => false
        },
        "extra"       => {}
      }
    )
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
