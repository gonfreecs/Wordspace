# SponsorsController
class SponsorsController < ApplicationController
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]
  before_action :check_for_approve, :check_for_reject # GET /sponsors

  # GET /sponsors.json
  def index
    if current_user.try(:is_moderator?)

      @reqspon = User.where("is_sponsor == '2'")

    else
      redirect_to root_path
    end
  end

  def check_for_approve
    return false if params[:type] != 'Approve'
    @car = User.find(params[:format])
    @car.update_attributes(is_sponsor: 1)
    redirect_to sponsors_path
  end

  def check_for_reject
    return false if params[:type] != 'Reject'
    @car = User.find(params[:format])
    @car.update_attributes(is_sponsor: 0)
    redirect_to sponsors_path
  end

  private

  # Never trust parameters from the scary internet
  def sponsor_params
    params[:sponsor]
  end
end
