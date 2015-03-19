	class ArticlesController < ApplicationController
	  #loading all variables
	load_and_authorize_resource
	#rescue from invalid articles ids
	rescue_from(ActiveRecord::RecordNotFound) {
	    raise(CanCan::AccessDenied, 'Article is not found')
		  }
	  # GET /articles
	  # GET /articles.json
	  def index
	    @articles = Article.all
	  end

	  # GET /articles/1
	  # GET /articles/1.json
	   def show
	  @user=User.find(@article.user_id)
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
	      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
	      format.json { head :no_content }
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
