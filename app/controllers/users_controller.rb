# k
class UsersController < ApplicationController
  before_filter :authenticate_user!
	  def show
	    @user = User.find(params[:id])
	    @articles = @user.articles
	  end
    def reports
    #here
  end
  def banned_users
  end
  def ban
    @user=User.find(params[:id])
    @user.is_banned = 1
    if @user.save
      flash[:notice] = 'User was successfully unbanned.'
      redirect_to :back
    else
      flash[:notice] = "Error banning user: #{@user.errors}"
      redirect_to :back
    end
  end
  def unban
    @user=User.find(params[:id])
    @user.is_banned = 0
    if @user.save
      flash[:notice] = 'User was successfully unbanned.'
      redirect_to :back
    else
      flash[:notice] = "Error unbaning user: #{@user.errors}"
      redirect_to :back
    end
  end
end
