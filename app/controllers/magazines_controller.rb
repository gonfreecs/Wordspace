# Author:Mohammed El-Ansary
# 5.4.2015
# Generated through scaffolding Magazine
class MagazinesController < ApplicationController
  # loading all variables
  load_and_authorize_resource
  # rescue from invalid articles ids
  rescue_from(ActiveRecord::RecordNotFound) do
    fail(CanCan::AccessDenied, 'Magazine is not found')
  end
  before_action :set_magazine, only: [:show, :edit, :update, :destroy]
  # check if cancel => no updates performed
  before_action :check_for_cancel, only: [:create, :update]

  # GET /magazines
  # GET /magazines.json
  def index
    @magazines = Magazine.all
  end

  # GET /magazines/1
  # GET /magazines/1.json
  def show
    @users = @magazine.users
    @articles = Article.where(magazine_id: params[:id])
  end

  # GET /magazines/new
  def new
    @magazine = Magazine.new
  end
  # Author: Omar Essam
  # created at: 2/5/2015
  # this code is for removing a collaborator
  def removeco
    @magazine = Magazine.find(params[:m_id])
    @colab = @magazine.users.find(params[:u_id])
    @magazine.users.delete(@colab)
    @colab.magazines.delete(@magazine)
    @colab.save
    @magazine.save
    redirect_to :back
end
  # GET /magazines/1/edit
  def edit
  end

  # To improve code style
  def error
    format.json do
      render json: @magazine.errors, status: :unprocessable_entity
    end
  end

  # POST /magazines
  # POST /magazines.json
  def create
    # Author:Mohammed El-Ansary
    # 5.4.2015
    # Adds current user to the magazine's list of contributers
    # and also adds the magazine to the user's list of magazines
    @magazine.users << current_user
    respond_to do |format|
      if @magazine.save
        format.html { redirect_to @magazine, notice: 'Successfully created.' }
        format.json { render :show, status: :created, location: @magazine }
      else
        format.html { render :new }
        error
      end
    end
  end

  # PATCH/PUT /magazines/1
  # PATCH/PUT /magazines/1.json
  def update
    respond_to do |format|
      if @magazine.update(magazine_params)
        format.html { redirect_to @magazine, notice: 'Successfully updated.' }
        format.json { render :show, status: :ok, location: @magazine }
      else
        format.html { render :edit }
        error
      end
    end
  end

  # DELETE /magazines/1
  # DELETE /magazines/1.json
  def destroy
    @magazine.destroy
    respond_to do |format|
      format.html do
        redirect_to magazines_url, notice: 'Successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  # Cancel an update and return to magazine page
  def check_for_cancel
    return false if params[:commit] != 'Cancel'
    redirect_to @magazine
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_magazine
    @magazine = Magazine.find(params[:id])
  end

  # Never trust parameters from the scary internet
  # only allow the white list through.
  def magazine_params
    params.require(:magazine).permit(:name, :decription, :image)
  end
end
