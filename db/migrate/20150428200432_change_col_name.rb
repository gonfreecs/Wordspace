class ChangeColName < ActiveRecord::Migration
  def change
    rename_column :collaboration_invitations, :User1_id, :User_id
    remove_column :collaboration_invitations, :User2_id
  end
end
