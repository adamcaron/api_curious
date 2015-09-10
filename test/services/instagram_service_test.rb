require "./test/test_helper"

class SunlightServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = InstagramService.new
  end

  test "#feed" do
    VCR.use_cassette('instagram_service_test#feed') do
      feed_posts = service.feed(ENV["APP_OWNER_IG_TOKEN"])[:data]
      post       = feed_posts.first

      assert_equal 17, feed_posts.count
      assert post.keys.include?(:user)
      assert post.keys.include?(:comments)
      assert post.keys.include?(:likes)
      assert post.keys.include?(:tags)
    end
  end
end