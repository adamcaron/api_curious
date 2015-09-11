require "rails_helper"

RSpec.describe FeedPost, :type => :model do

  let(:user) { $user = create_user! }

  it "has access to the Instagram service" do
    service = FeedPost.service

    expect(service.class).to eq(InstagramService)
  end

  it "returns all the posts for a user's feed" do
    VCR.use_cassette('feed_post#returns_all_posts') do
      feed_posts = FeedPost.all(user)

      expect(FeedPost).to eq(feed_posts.last.class)
    end
  end
end