# mohab
# 1.4.2015
# user
class UsersController < ApplicationController
  # mohab
  # 1.4.2015
  # show profile page
  before_filter :authenticate_user!
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  # Andrew
  # 8.4.15
  # Follow User
  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to :back
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to :back
  end
  # Hariry
  # 29.4.2015
  # control panel for user's articles
  def controls
  end
end
