class AdsController < ApplicationController
  def create
    @ad= Ad.new
    @ad.des= params[:des2]
    @ad.title=params[:title2]
    @ad.user_id=params[:u_id]
    @ad.title=@ad.title.downcase
    if Ad.where({title:  @ad.title ,user_id:current_user.id})==[]
      if @ad.save
      flash[:notice] = 'Ad was successfully created.'
      redirect_to ({controller: :sponsors, action: :control})
    else
      flash[:notice] = "Error creating Ad: #{@bid.errors}"

      redirect_to( {controller: :sponsors, action: :control})
  end
else
  flash[:notice] = "title already exists"

  redirect_to( {controller: :sponsors, action: :control})
end
end
end
