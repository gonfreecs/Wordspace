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
  end
