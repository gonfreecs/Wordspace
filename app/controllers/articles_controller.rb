	class ArticlesController < ApplicationController
	  #loading all variables
	load_and_authorize_resource
	#rescue from invalid articles ids
	rescue_from(ActiveRecord::RecordNotFound) {
	    raise(CanCan::AccessDenied, 'Article is not found')
		  }
		  # check if cancel => no updates performed
	before_filter :check_for_cancel, :only => [:create, :update]

	 before_filter :check_for_report, :only => [:show]
	  # GET /articles
	  # GET /articles.json
	  def index
	    @articles = Article.all
	  end

	  # GET /articles/1
	  # GET /articles/1.json
	  #inistantiation of Comment and Reply objects 
	   def show
	  @user=User.find(@article.user_id)
	  @comment = Comment.new(params[:comment])
	  #@comment.update_attributes(:user_id=> current_user.id, :article_id=> @article.id)
	  @replies = Reply.all
	  @reply = Reply.new(params[:reply])
	  #@reply.update_attributes(:user_id=>@comment.user_id, :comment_id=>@comment.id, :article_id=>@comment.article_id)
  
	  end

	  # GET /articles/new
	  def new
	    @article = Article.new
	  end

	  # GET /articles/1/edit
	  def edit
	  end

	  # POST /articles
	  # POST /articles.json
	  def create
	    @article.user=current_user

	    respond_to do |format|
	      if @article.save
	        format.html { redirect_to @article, notice: 'Article was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end
	  end

	  # PATCH/PUT /articles/1
	  # PATCH/PUT /articles/1.json
	  def update
	    respond_to do |format|
	      if @article.update(article_params)
	        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
	        format.json { render :show, status: :ok, location: @article }
	      else
	        format.html { render :edit }
	        format.json { render json: @article.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  # DELETE /articles/1
	  # DELETE /articles/1.json
	  def destroy
	    @article.destroy
	    respond_to do |format|
	      format.html { redirect_to root_path, notice: 'Article was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end
# Cancel an update and return to article page
def check_for_cancel
  if params[:commit] == "Cancel"
    redirect_to @article
  end
end

def check_for_report
    flash[:notice] = "Widget was successfully created."
  if params[:type] == "Report"
    @article = Article.find(params[:format])
    @article.update_attributes(:is_reported => true)
    render action: 'show'
  end
end

	  private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_article
	    @article = Article.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def article_params
			params.require(:article).permit(:title, :body, :user_id, :id, :image)
	    end
	end
