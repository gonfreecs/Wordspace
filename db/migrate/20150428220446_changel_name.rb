class ChangelName < ActiveRecord::Migration
  def change
    rename_column :collaboration_invitations, :User_id, :user_id
  end
end
