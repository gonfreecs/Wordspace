class AddBudgetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :budget, :int, :default => 1000000000
  end
end
