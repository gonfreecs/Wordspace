# Author:Omar El-hariry
# 1.4.2015
# User controller
class UsersController < ApplicationController
  before_filter :authenticate_user!
  # mohab
  # 1.4.2015
  # user show
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def reports
  end

  def banned_users
  end
  # Author:Omar El-hariry
  # 1.4.2015
  # change attribute value to indicate user is banned
  def ban
    @user = User.find(params[:u_id])
    @user.is_banned = 1
    if @user.save
      flash[:notice] = 'User was successfully unbanned.'
      redirect_to :back
    else
      flash[:notice] = "Error banning user: #{@user.errors}"
      redirect_to :back
    end
  end
  # Author:Omar El-hariry
  # 1.4.2015
  # change attribute value to indicate user is not banned
  def unban
    @user = User.find(params[:u_id])
    @user.is_banned = 0
    if @user.save
      flash[:notice] = 'User was successfully unbanned.'
      redirect_to :back
    else
      flash[:notice] = "Error unbaning user: #{@user.errors}"
      redirect_to :back
    end
  end
  # Author:Omar El-hariry
  # 1.4.2015
  # change attribute value to indicate article is dismissed
  def dismiss_article
    @reportarticles = Reportarticle.where(article_id: params[:a_id])
    @reportarticles.each do|rep_art|
      rep_art.is_dismissed = 1
      if rep_art.save
        flash[:notice] = 'Article was successfully dismissed.'
      else
        flash[:notice] = "Error dismissing article: #{rep_art.errors}"
      end
    end
    redirect_to :back
  end
  # Author:Omar El-hariry
  # 1.4.2015
  # change attribute value to indicate comment is dismissed
  def dismiss_comment
    @reportcomments = Reportcomment.where(comment_id: params[:c_id])
    @reportcomments.each do|rep_com|
      rep_com.is_dismissed = 1
      if rep_com.save
        flash[:notice] = 'Article was successfully dismissed.'
      else
        flash[:notice] = "Error dismissing article: #{rep_com.errors}"
      end
    end
    redirect_to :back
  end
  def destroy
  end
end
