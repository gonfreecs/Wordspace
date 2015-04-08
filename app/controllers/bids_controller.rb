class BidsController < ApplicationController
  authorize_resource
  def index
  end

  def new
  end

  def show
  end

  def create
    @bid = Bid.new( :user_id =>current_user.id, :status=> "pending")
    @title=params[:title2]
    @bid.ad_id=Ad.where({title:  @title ,user_id:current_user.id}).id
    @article_id= params[:article_id]
    @offer= params[:offer2]
    @offer3 = params[:offer3]
    if(@offer !=nil)
      @bid.offer=@offer
    else

        @bid.offer=@offer3

    end
    @bid.article_id = @article_id

      if @bid.save
        flash[:notice] = 'Bid was successfully created.'
        redirect_to article_path(@bid.article_id)
      else
        flash[:notice] = "Error creating Bid: #{@bid.errors}"

        redirect_to(@bid.article_id)

  end
end
  def update
  end

  def destroy

    bid = Bid.find(params[:bid_id])
    bid.destroy
    redirect_to  :controller => :sponsors	, :action => :control

  end

  def edit
  end
end
