class AddCuratorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :curator, :boolean
  end
end
