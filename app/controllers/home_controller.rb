class HomeController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @users = User.all
    render :partial => "layouts/live_score"
  end
end
