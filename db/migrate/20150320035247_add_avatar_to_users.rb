class AddAvatarToUsers < ActiveRecord::Migration
  # add column for avatar

  def change
    add_column :users, :avatar, :string
  end
end
