class FeedPost < OpenStruct
  def self.service
    @service ||= InstagramService.new
  end

  def self.all(user)
    response = service.feed(user.token)
    response["data"].map { |post| FeedPost.new(post) }
  end

  attr_reader :image_url

  def initialize(post_info)
    @image_url = post_info["images"]["standard_resolution"]["url"]
  end
end

# Caption Username ___________
# r["data"].first["caption"]["from"]["username"]