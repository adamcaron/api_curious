class HomeController < ApplicationController
  def show
    render :welcome unless current_user

    @feed_posts = FeedPost.all(current_user)
  end
end
