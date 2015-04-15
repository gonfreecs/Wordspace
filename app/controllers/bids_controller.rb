# Author: Omar Essam
# created at: 1/4/2015
# this controller is for bids action which consists of only 2 actions, create
# with user_id, ad_id, article_id, & offer as parameters
# and destrou whic hmainly deletes a bid
class BidsController < ApplicationController
  authorize_resource
  def index
  end

  def new
  end

  def show
  end

  def create

    @title = params[:title2]
    @ad = Ad.where(title:  @title, user_id: current_user.id)
    @ad_id = @ad[0].id if @ad != []
    @article_id = params[:article_id]
    @off3 = params[:offer3]
    @off2 = params[:offer1]
    if @off3 != ""
      @offer = @off3.to_i
    else
      @offer = @off2.to_i

    end
    @bid = Bid.new(user_id: current_user.id, status: 'pending',
                   article_id: @article_id, ad_id: @ad_id, offer: @offer)
    if @bid.save
      flash[:notice] = 'Bid was successfully created.'
      redirect_to article_path(@bid.article_id)
    else
      flash[:notice] = "Error creating Bid: #{@bid.errors}"

      redirect_to :back

    end
  end

  def update
  end

  def destroy
    bid = Bid.find(params[:bid_id])
    bid.destroy
    redirect_to controller: :sponsors, action: :control
  end

  def edit
  end
end
