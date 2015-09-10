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

  attr_reader :id, :owner_profile_pic, :username, :location, :image_url, :comments

  def initialize(post_data)
    @id        = post_data["id"]
    @owner_profile_pic = post_data["user"]["profile_picture"]
    @location  = post_data["location"]["name"] unless post_data["location"].nil?
    @username  = post_data["user"]["username"]
    @image_url = post_data["images"]["standard_resolution"]["url"]
    @comments  = post_data["comments"]["data"].map { |comment| PostComment.new(comment) }
  end
end

# Caption Username ___________
# r["data"].first["caption"]["from"]["username"]