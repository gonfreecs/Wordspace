class AddBudgetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :budget, :int, default: 1_000_000_000
  end
end
