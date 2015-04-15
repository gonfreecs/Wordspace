	class ArticlesController < ApplicationController
		#set_tab :article
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
	  #inistantiation of Comment and Reply objects
	   def show
	  @user=User.find(@article.user_id)
	  @comment = Comment.new(params[:comment])
	  @replies = Reply.all
	  @reply = Reply.new(params[:reply])
		@report = Reportarticle.where("user_id = ? AND article_id = ?", current_user.id ,params[:id])


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

		def dismiss
			@reportarticles=Reportarticle.where(:article_id => params[:a_id])
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

		def report
			#Author:Mina Hany
		  #3.4.2015
		  #A hash is created containing user's id who wants to report an article
		  #and that article's id and it is added to model contaioning reported requests
			reportarticleh = {"user_id" => current_user.id,
												"article_id" => params[:id],
												"is_dismissed" => 0}
			Reportarticle.create(reportarticleh)
			 @article =Article.find( params[:id])
			redirect_to @article
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
