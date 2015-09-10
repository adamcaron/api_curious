class FeedPost < OpenStruct
  def self.service
    @service ||= InstagramService.new
  end

  def self.all(current_user)
    service.feed(current_user.token)
  end

end

# feed.posts
# feed.post

# need to know current_user
# create a new FeedPost