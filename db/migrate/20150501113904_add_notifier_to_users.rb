class AddNotifierToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notifier, :integer, default: 0
  end
end
