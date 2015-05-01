class AddNotifyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notify, :integer, :default => 0
  end
end
