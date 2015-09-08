class HomeController < ApplicationController
  def show
    render :welcome unless current_user
  end
end
