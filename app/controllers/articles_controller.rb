# Article Controller
class ArticlesController < ApplicationController
  # loading all variables
  load_and_authorize_resource
  # rescue from invalid articles ids
  rescue_from(ActiveRecord::RecordNotFound) do
    fail(CanCan::AccessDenied, 'Article is not found')
  end
  # check if cancel => no updates performed
  before_action :check_for_cancel, only: [:create, :update]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  # inistantiation of Comment and Reply objects
  def show
    @user = User.find(@article.user_id)
    @comment = Comment.new(params[:comment])
    @replies = Reply.all
    @reply = Reply.new(params[:reply])
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
    @article.user = current_user

    # Author: Mayar
    # Date: 7.4.2015
    # Description: adding magazine parameter to article of magazine
    unless params[:magazine_id].nil?
      @article.magazine_id = params[:magazine_id]
    end

    # Author: Mohammed El-Ansary
    # 1.4.2015
    # Filling the plain body which is used in the search
    @article.plain_body = ActionView::Base.full_sanitizer
      .sanitize(@article.body)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was created.' }
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
        format.html { redirect_to @article, notice: 'Article was updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json render json: @article.errors,
                           status: :unprocessable_entity
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Article was destroyed.' }
      format.json { head :no_content }
    end
  end
  # Cancel an update and return to article page
  def check_for_cancel
    return false if params[:commit] != 'Cancel'
    redirect_to @article
  end
end

# Report an article
def report
  reportarticlehash = { "user_id" => current_user.id,
                    "article_id" => params[:id] }
  Reportarticle.create(reportarticlehash)
  @article = Article.find(params[:id])
  redirect_to @article
end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet
  def article_params
    params.require(:article).permit(:title, :body, :user_id, :id, :image,
                                    :magazine_id)
  end
