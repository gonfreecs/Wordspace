class RepliesController < ApplicationController
    #loading all variables
	load_and_authorize_resource
	#rescue from invalid articles ids
	rescue_from(ActiveRecord::RecordNotFound) {
	    raise(CanCan::AccessDenied, 'Reply is not found')
		  }
		  
		    # POST action
		  # Create and save reply inistance
  def create
    if @reply.save
      flash[:notice] = 'reply was successfully created.'
      redirect_to(@reply.comment.article)
    else
      flash[:notice] = "Error creating reply: #{@reply.errors}"
      redirect_to(@reply.comment.article)
    end
    
  end
 
  
  # Delete action
  # Delete reply inistance
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to(@reply.comment.article)
  end
  def index
  end
  def show
  
  end
  
  # PUT action
  # update comment inistance
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
  
	  # Never trust parameters from the scary internet, only allow the white list through.
	def reply_params
			params.require(:reply).permit(:user_id, :article_id, :comment_id, :des)
	end

end
