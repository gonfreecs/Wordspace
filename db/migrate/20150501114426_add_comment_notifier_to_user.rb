class AddCommentNotifierToUser < ActiveRecord::Migration
  def change
    add_column :users, :comment_notifier, :integer, default: 0
  end
end
