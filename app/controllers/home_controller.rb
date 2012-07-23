class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def scoreboard
    render :partial => "layouts/live_score"
  end
end
