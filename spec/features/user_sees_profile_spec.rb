require "rails_helper"

RSpec.feature "User", type: :feature do
  scenario "sees link to profile on homepage" do
    VCR.use_cassette("user_sees_link_to_profile_on_homepage") do
      visit root_path
      login_user!
      click_link "Log In"

      click_link "adamcaron_"

      expect(current_path).to eq("/adamcaron_")
    end
  end

  # "profile page has profile info"
end