require "rails_helper"

RSpec.feature "User logs in", type: :feature do
  scenario "successfully authenticates with Instagram" do
    VCR.use_cassette("user_logs_in_test#successfully_authenticates_with_ig") do
      visit root_path
      expect(status_code).to be(200)
      expect(page).to have_no_content("adamcaron_")

      login_user!
      click_link "Log In"

      expect(current_path).to eq(root_path)
      expect(page).to have_no_content("Login")
      expect(page).to have_content("adamcaron_")
    end
  end
end