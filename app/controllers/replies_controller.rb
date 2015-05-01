# Author: Omar El-Hariry
class RepliesController < ApplicationController
  # loading all variables
  load_and_authorize_resource
  # rescue from invalid articles ids
  rescue_from(ActiveRecord::RecordNotFound) do
    fail(CanCan::AccessDenied, 'Reply is not found')
  end
  def create
    # @reply = Reply.new(params[:reply])
    if @reply.save
      flash[:notice] = 'reply was successfully created.'
      redirect_to(@reply.comment.article)
    else
      flash[:notice] = "Error creating reply: #{@reply.errors}"
      redirect_to(@reply.comment.article)
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to(@reply.comment.article)
  end

  def index
  end

  def show
  end

  def update
    if @reply.update(params[:reply])
      flash[:notice] = 'reply was successfully created.'
      redirect_to(@reply.comment.article)
    else
      flash[:notice] = "Error creating reply: #{@reply.errors}"
      redirect_to(@reply.comment.article)
    end
  end

  def edit
  end

  def new
  end

  def report
    # Author:Mina Hany
    # 8.4.2015
    # A hash is created containing user's id who wants to report a reply
    # and that reply's id and it is added to model contaianing
    # reporting requests
    @report = Reportreply.where('user_id = ? AND reply_id = ?',
                                current_user.id, :id)
    @article = Article.find(params[:article_id])
    redirect_to @article && return if @report.present?
    reportreplyhash = { 'user_id' => current_user.id,
                        'reply_id' => :id }
    Reportreply.create(reportreplyhash)
    redirect_to @article
  end

  def reply_params
    params.require(:reply).permit(:user_id, :article_id, :comment_id, :des)
  end
end
