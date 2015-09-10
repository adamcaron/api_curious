require './test/test_helper'

class FeedPostTest < ActiveSupport::TestCase
  test "has access to service" do
    service = FeedPost.service

    assert_equal InstagramService, service.class
  end
end