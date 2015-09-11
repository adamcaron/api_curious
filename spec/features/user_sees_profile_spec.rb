require "rails_helper"

RSpec.feature "User sees profile", type: :feature do
  scenario "navigates to profile from homepage link" do
    VCR.use_cassette("user_sees_profile_test#navigates_to_profile_from_homepage_link") do
      visit root_path
      login_user!
      click_link "Log In"

      click_link "adamcaron_"

      expect(current_path).to eq("/adamcaron_")
    end
  end

  # "profile page has profile info"
end