class FeedPost
  def self.service
    @service ||= InstagramService.new
  end

  def self.all(user)
    unless user.nil?
      response = service.feed(user.token)
      response[:data].map { |post| FeedPost.new(post) }
    end
  end

  attr_reader :id,
              :owner_profile_pic,
              :username,
              :location,
              :image_url,
              :likes,
              :caption,
              :comments

  def initialize(post_data)
    @id                = post_data[:id]
    @owner_profile_pic = post_data[:user][:profile_picture]
    @username          = post_data[:user][:username]
    @location          = post_data[:location][:name] unless post_data[:location].nil?
    @image_url         = post_data[:images][:standard_resolution][:url]
    @likes             = post_data[:likes][:count]
    @caption           = {
                          username: post_data[:caption][:from][:username],
                          text:     post_data[:caption][:text]
                        } unless post_data[:caption].nil?
    @comments          = post_data[:comments][:data].map { |comment| PostComment.new(comment) }
  end
end