# CommentsController
class CommentsController < ApplicationController
  # loading all variables
  load_and_authorize_resource
  # rescue from invalid articles ids
  rescue_from(ActiveRecord::RecordNotFound) do
    fail(CanCan::AccessDenied, 'Comment is not found')
  end
  # POST action
  # Create and save comment inistance
  def create
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
    redirect_to :back
  end

  def index
  end

  # GET action
  # show comment

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

  def dismiss
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

  def report
    # Author:Mina Hany
    # 8.4.2015
    # A hash is created containing user's id who wants to report a comment
    # and that comment's id and it is added to moedl contaioning
    # reported requests
    reportcommenth = { 'user_id' => current_user.id,
                       'comment_id' => params[:id],
                       'is_dismissed' => 0 }
    Reportcomment.create(reportcommenth)
    # @article =Article.find( params[:id])
    redirect_to :back
  end

  # Never trust parameters from the scary internet, only allow
  # the white list through.
  def comment_params
    params.require(:comment).permit(:user_id, :article_id, :des)
  end
end
