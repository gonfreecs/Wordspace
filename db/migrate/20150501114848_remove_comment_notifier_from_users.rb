class RemoveCommentNotifierFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :comment_notifier, :integer
  end
end
