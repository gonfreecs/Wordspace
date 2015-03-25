class UsersController < ApplicationController
#user
# show profile page  
 before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])

  end

end
