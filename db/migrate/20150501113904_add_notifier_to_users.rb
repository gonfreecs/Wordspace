# Author: Mayar
# Date: 1.5.2015
# Added notifier column to users
class AddNotifierToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notifier, :integer, default: 0
  end
end
