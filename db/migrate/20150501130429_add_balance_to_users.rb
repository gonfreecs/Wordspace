class AddBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :balance, :numeric, default: 0
  end
end
