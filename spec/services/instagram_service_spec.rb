require "rails_helper"

RSpec.describe InstagramService, :type => :model do
  let(:service) { $service = InstagramService.new }

  it "returns a feed of Instagram posts" do
    VCR.use_cassette('instagram_service_test#returns_a_feed_of_instagram_posts') do
      feed_posts = service.feed(ENV["APP_OWNER_IG_TOKEN"])[:data]
      post       = feed_posts.first

      assert post.keys.include?(:user)
      assert post.keys.include?(:comments)
      assert post.keys.include?(:likes)
      assert post.keys.include?(:tags)
    end
  end
end