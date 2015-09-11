require './test/test_helper'

class UserSeesProfileTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "homepage has link to profile" do
    skip
    VCR.use_cassette("user_sees_profile#homepage_has_link_to_profile") do
      visit root_path
      stub_user_data!
      click_link "Log In"

      click_link "adamcaron_"

      assert_equal '/adamcaron_', current_path
    end
  end

  test "profile page has profile info" do
  end
end