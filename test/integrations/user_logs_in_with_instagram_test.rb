require './test/test_helper'

class UserLogsInWithInstagramTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "logs in" do
    VCR.use_cassette('user_login_test#login') do
      visit root_path
      assert_equal 200, page.status_code
      refute page.has_content?("adamcaron_")

      stub_oauth_data!
      click_link "Log In"

      assert_equal "/", current_path
      refute page.has_content?("Login")
      assert page.has_content?("adamcaron_")
    end
  end
end