#
class NotificationsController < ApplicationController


  # Author: Mayar, Omar Essam
  # Date: 1.5.2015
  # controlling notification
  def clear
    current_user.notifier = 0
    current_user.save
  end
  def sherief
    render :partial => 'sheriet'
  end
  def sheriet

  end
  def maya
    @articles = []
    Comment.all.order(created_at: :desc).each do |c|

    @article = Article.find(c.article_id)
    if @article.user_id == current_user.id
      @articles << @article.id
      end
    end
    @n = current_user.notifier
    @articles = @articles[0..(@n-1)]
    render :partial => 'mayar'
  end
  def getarticle
    @id = params[:id2]
    @title =Article.find(@id).title
    render :partial => 'article'
  end
end
