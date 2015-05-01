  # Author: Mayar
  # Date: 8.4.2015
  # Invitation Controller
  class CollaborationInvitationsController < ApplicationController
    # Author: Mayar
    # Date: 8.4.2015
    # Showing invitations to that user
    def index
      @reqinv = CollaborationInvitation.where(user_id: current_user.id)
    end

    # Author: Mayar
    # Date: 8.4.2015
    # Approving invitation
    def check_for_approve
      @invite = CollaborationInvitation.find(params[:id])
      @magazine = Magazine.find(@invite.Magazine_id)
      @magazine.users << current_user
      @invite.destroy
      @invite.save
      redirect_to collaboration_invitations_path
    end

    # Author: Mayar
    # Date: 7.4.2015
    # Rejecting invitation
    def check_for_reject
      @record = CollaborationInvitation.find(params[:id])
      @record.destroy
      redirect_to collaboration_invitations_path
    end
  end
