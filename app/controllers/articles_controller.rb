 # Authors: Omar Essam, Mayar, Andrew, & Mohammed El-Ansary
 # created at: unknown
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
    if params[:tag]
      @articles = Article.tagged_with(params[:tag], on: 'tags')
    elsif params[:category]
      @articles = Article.tagged_with(params[:category], on: 'categories')
    else
      @articles = Article.all
    end
  end

   # GET /articles/1
   # GET /articles/1.json
   # inistantiation of Comment and Reply objects
   def show
     @user = User.find(@article.user_id)
     @comment = Comment.new(params[:comment])
     @replies = Reply.all
     @reply = Reply.new(params[:reply])
     return unless @article.is_sponsored
     # Author: Omar Essam
     # created at: 5/4/2015
     # putting ads in article view
     @bid = Bid.where(article_id: @article.id)[0]
     @ad = Ad.where(title: @article.ad_title, user_id: @bid.user_id)[0]
     @des = @ad.des.html_safe
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
     redirect_to @article if params[:commit] == 'Cancel'
   end

   def bid
     @ar = Article.find(params[:a2_id])
     redirect_to controller: :bids, action: :create, a_id: @ar.id
   end

   private

   # Use callbacks to share common setup or constraints between actions.
   def set_article
     @article = Article.find(params[:id])
   end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet
  def article_params
    params.require(:article).permit(:title, :body, :user_id, :id, :image,
                                    :tag_list, :category_list, :magazine_id,
                                    :homepagelist)
  end
end
