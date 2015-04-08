# Author: Mayar
# Date: 8.4.2015
# Invitation Controller
class CollaborationInvitationsController < ApplicationController
  before_action :check_for_approve, :check_for_reject # GET /sponsors

  def index
    @reqinv = CollaborationInvitation.all
  end

  def check_for_approve
    return false if params[:type] != 'Approve'
    @i = params[:i2]
    @user = User.find(@i.User_id)
    @magazne = Magazine.find(@i.Magazine_id)
    @magazine.users << @user
    @record = CollaborationInvitation.find(@i)
    ColloborationInvitation.destroy(@record)
    redirect_to invitations_path
  end

  def check_for_reject
    return false if params[:type] != 'Reject'
    @record = CollaborationInvitation.find(params[:i2])
    ColloborationInvitation.destroy(@record)
    redirect_to invitations_path
  end
end
