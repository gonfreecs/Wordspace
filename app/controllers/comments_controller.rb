class CommentsController < ApplicationController
  
    #loading all variables
	load_and_authorize_resource
	#rescue from invalid articles ids
	rescue_from(ActiveRecord::RecordNotFound) {
	    raise(CanCan::AccessDenied, 'Comment is not found')
		  }
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
  		 #@user=User.find(@article.user_id)
	  @reply = Reply.new(params[:reply])
	  #@reply.update_attributes(:user_id=>@comment.user_id, :comment_id=>@comment.id, :article_id=>@comment.article_id)
    #redirect_to(@comment.article)
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
	def comment_params
			params.require(:comment).permit(:user_id, :article_id, :des)
	end
end
