require "rails_helper"

RSpec.describe User, :type => :model do

  let(:oauth_response) {
    $oauth_response = OmniAuth::AuthHash.new(
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
  }

  it "is found or created by oauth data" do
    user = User.find_or_create_from_auth(oauth_response)

    expect(user.uid).to eq("1644186282")
    expect(user.provider).to eq("instagram")
    expect(user.nickname).to eq("adamcaron_")
  end
end