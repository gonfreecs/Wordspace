class CreateCollaborationInvitations < ActiveRecord::Migration
  def change
    create_table :collaboration_invitations do |t|
      t.integer :status
      # sender
      t.integer :User1_id
      # receiver
      t.integer :User2_id
      t.integer :Magazine_id
      t.timestamps null: false
    end
  end
end
