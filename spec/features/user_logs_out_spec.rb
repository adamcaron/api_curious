require "rails_helper"

RSpec.feature "User logs out", type: :feature do

  let(:user) { $user = create_user! }

  scenario "logout link goes to welcome page and user is logged out" do
    VCR.use_cassette("user_logs_out_test#logout_link_goes_to_welcome_page_and_user_is_logged_out") do
      visit root_path
      login_user!
      click_link "Log In"
      click_link "adamcaron_"

      expect(page).to have_link("Log out")
      click_link "Log out"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome")
      expect(page).to have_link("Login with Instagram")
    end
  end
end