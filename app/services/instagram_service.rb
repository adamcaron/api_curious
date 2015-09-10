class InstagramService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.instagram.com/v1")
  end

  def feed(token)
    parse(connection.get("users/self/feed?access_token=#{token}"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end