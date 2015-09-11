require "rails_helper"

RSpec.feature "User sees profile", type: :feature do

  let(:user) { $user = create_user! }

  scenario "navigates to profile from homepage link" do
    VCR.use_cassette("user_sees_profile_test#navigates_to_profile_from_homepage_link") do
      visit root_path
      login_user!
      click_link "Log In"

      click_link "adamcaron_"

      expect(current_path).to eq("/adamcaron_")
    end
  end

  scenario "profile displays user-specific profile info" do
    VCR.use_cassette("user_sees_profile_test#profile_displays_user_specific_profile_info") do
      visit root_path
      login_user!
      click_link "Log In"

      click_link "adamcaron_"

      expect(page).to have_content("Adam Caron")
      expect(page).to have_content("adamcaron_")
      expect(page).to have_content("NH🍁 -> CO🌲")
    end
  end
end