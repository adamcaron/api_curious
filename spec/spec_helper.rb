require 'simplecov'
SimpleCov.start 'rails'

require 'webmock'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock # after VCR records the response, stub the info
end

RSpec.configure do |config|
  require 'capybara/rspec'
  config.include Capybara::DSL

  require 'database_cleaner'
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  def login_user!
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

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://myronmars.to/n/dev-blog/2014/05/notable-changes-in-rspec-3#new__config_option_to_disable_rspeccore_monkey_patching
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
