# Invite user to become a collaborator to Magazine
class CollaborationInvitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :magazine
end
