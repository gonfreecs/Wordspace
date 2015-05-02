# Author: Mayar
# Date 28.4.2015
# Generating Users controller
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Author: Mayar
  # Date: 28.4.2015
  # getting user's magazines
  def mymagazines
    @magazines = []
    Magazine.all.each do |magazine|
      if magazine.users.include?(current_user)
        @magazines << magazine
      end
    end
  end
  # mohab
  # 1.4.2015
  # show profile page
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  # Andrew
  # 8.4.15
  # Follow User
  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to :back
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to :back
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def user_params
    params[:user]

  # Hariry
  # 29.4.2015
  # control panel for user's articles
  def controls
  	@my_articles = Article.where(:user_id => current_user.id)
    @sponsered_articles = Article.where(:user_id => current_user.id,:is_sponsored => true)
    @promoted_articles_1000 = Article.where(:user_id => current_user.id,:promotevalue => 1000000 )
    @promoted_articles_2000 = Article.where(:user_id => current_user.id,:promotevalue => 2000000 )
    @promoted_articles_3000 = Article.where(:user_id => current_user.id,:promotevalue => 3000000 )

  end
end
