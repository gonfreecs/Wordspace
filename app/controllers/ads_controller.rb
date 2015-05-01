# Author: Omar Essam
# Created at: 9/4/2015
# this controller is for the ads which includes only creating a new ad,
# Parameters of an ad are  title, user_id & description
class AdsController < ApplicationController
  load_and_authorize_resource
  def create
    @ad = Ad.new
    @ad.des = params[:des2]
    @ad.title = params[:title2]
    @ad.user_id = params[:u_id]
    @ad.title = @ad.title.downcase
    if Ad.where(title:  @ad.title, user_id: current_user.id) == []
      if @ad.save
        flash[:notice] = 'Ad was successfully created.'
        redirect_to controller: :sponsors, action: :control
      else
        flash[:notice] = "Error creating Ad: #{@ad.errors}"

        redirect_to(controller: :sponsors, action: :control)
      end
    else
      flash[:notice] = 'title already exists'
      redirect_to controller: :sponsors, action: :control
    end
  end
end
