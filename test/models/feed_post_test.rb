require './test/test_helper'

class FeedPostTest < ActiveSupport::TestCase
  attr_reader :user

  def setup
    @user = create_user!
    # @service ||= FeedPost.service
  end

  test "has access to service" do
    service = FeedPost.service

    assert_equal InstagramService, service.class
  end

  test "returns all the posts for a user's feed" do
    VCR.use_cassette('feed_post_test#all') do
      feed_posts = FeedPost.all(user)

      assert_equal FeedPost, feed_posts.last.class
    end
  end
end