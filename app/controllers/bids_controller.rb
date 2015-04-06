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
    @article= Article.find(params[:a_id])
    @bid.article_id = @article.id
      if @bid.save
        flash[:notice] = 'Bid was successfully created.'
        redirect_to article_path(@bid.article_id)
      else
        flash[:notice] = "Error creating Bid: #{@bid.errors}"
        redirect_to(@bid.article)
  end
end
  def update
  end

  def destroy
  end

  def edit
  end
end
