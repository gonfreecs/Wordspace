# Author: Mayar
# Date: 8.4.2015
# Invitation Controller
class CollaborationInvitationsController < ApplicationController

  # Author: Mayar
  # Date: 8.4.2015
  # Showing invitations to that user
  def index
    @reqinv = CollaborationInvitation.where(:User_id => current_user.id)
  end

  # Author: Mayar
  # Date: 8.4.2015
  # Approving invitation
  def check_for_approve
    @invite = CollabotaionInvitation.find(params[:id])
    @magazne = Magazine.find(@invite.Magazine_id)
    @magazine.users << current_user.id
    Collabotation.destroy.where(:User_id => current_user.id, :Magazine_id => @magazine.id)
    redirect_to invitations_path
  end

  # Author: Mayar
  # Date: 7.4.2015
  # Rejecting invitation
  def check_for_reject

    @record = CollaborationInvitation.find(params[:i2])
    ColloborationInvitation.destroy(@record)
    redirect_to invitations_path
  end
end
