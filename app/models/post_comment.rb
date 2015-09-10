class PostComment

  attr_reader :username, :text

  def initialize(comment)
    @username = comment[:from][:username]
    @text     = comment[:text]
  end
end