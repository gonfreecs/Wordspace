class Ban < ActiveRecord::Migration
  def change
    add_column :users, :is_banned, :integer
    # add_column :users, :avatar, :string
  end
end
