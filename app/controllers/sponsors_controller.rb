class SponsorsController < ApplicationController
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_approve , :check_for_reject # GET /sponsors
  authorize_resource :class => false

  # GET /sponsors.json
  def index


    @reqspon = User.where("is_sponsor == '2'")


  end

def control
  @pending_bids= Bid.where({user_id:current_user.id }).pending.order(created_at: :desc)
  @accepted_bids= Bid.where({user_id:current_user.id }).accepted.order(created_at: :desc)
  @ads=Ad.where({user_id:current_user.id})
  
end


  def check_for_approve
    flash[:notice] = "Widget was successfully created."
  if params[:type] == "Approve"
    @car = User.find(params[:format])
    @car.update_attributes(:is_sponsor => 1)
    redirect_to sponsors_path
  end
end

  def check_for_reject
    flash[:notice] = "Widget was successfully created."
  if params[:type] == "Reject"
    @car = User.find(params[:format])
    @car.update_attributes(:is_sponsor => 0)
    redirect_to sponsors_path
  end
end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_params
      params[:sponsor]
    end
end
