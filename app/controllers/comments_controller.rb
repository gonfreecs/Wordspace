# CommentsController
class CommentsController < ApplicationController
  # loading all variables
  load_and_authorize_resource
  # rescue from invalid articles ids
  rescue_from(ActiveRecord::RecordNotFound) do
    fail(CanCan::AccessDenied, 'Comment is not found')
  end
  def create
    # @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.article)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to(@comment.article)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(@comment.article)
  end

  def index
  end

  def show
    @reply = Reply.new(params[:reply])
  end

  def update
    if @comment.update(params[:comment])
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.article)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to(@comment.article)
    end
  end

  def edit
  end

  def new
  end

  def report
    # Author:Mina Hany
    # 8.4.2015
    # A hash is created containing user's id who wants to report a comment
    # and that comment's id and it is added to model contaioning reported requests
    @report = Reportcomment.where(
                                "user_id = ? AND comment_id = ?", current_user.id, @comment.id)
    @article = Article.find(params[:id])
    if @report.present?
      redirect_to @article && return
    end
    reportcommenthash = { "user_id" => current_user.id,
                       "comment_id" => @comment.id }
    Reportcomment.create(reportcommenthash)
    redirect_to @article
  end

  def comment_params
    params.require(:comment).permit(:user_id, :article_id, :des)
  end
end
