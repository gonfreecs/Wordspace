class CommentsController < ApplicationController
  
    #loading all variables
	load_and_authorize_resource
	#rescue from invalid articles ids
	rescue_from(ActiveRecord::RecordNotFound) {
	    raise(CanCan::AccessDenied, 'Comment is not found')
		  }
		  
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
 
  # Delete action
  # Delete comment inistance
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(@comment.article)
  end
  def index
  end
  # GET action
  # show comment
  def show
  
	  @reply = Reply.new(params[:reply])
	  
  end
  # PUT action
  # update comment inistance
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
  
	  # Never trust parameters from the scary internet, only allow the white list through.
	def comment_params
			params.require(:comment).permit(:user_id, :article_id, :des)
	end
end
