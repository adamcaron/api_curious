class FeedPost < OpenStruct
  def self.service
    @service ||= InstagramService.new
  end

  def self.all(user)
    unless user.nil?
      response = service.feed(user.token)
      response["data"].map { |post| FeedPost.new(post) }
    end
  end

  attr_reader :image_url, :id, :comments

  def initialize(post_data)
    @id        = post_data["id"]
    @image_url = post_data["images"]["standard_resolution"]["url"]
    @comments  = post_data["comments"]["data"].map { |comment| PostComment.new(comment) }
  end
end

# Caption Username ___________
# r["data"].first["caption"]["from"]["username"]