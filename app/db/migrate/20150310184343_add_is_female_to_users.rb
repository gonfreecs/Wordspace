class AddIsFemaleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_female, :boolean, default: false
     add_column :users, :about_me, :text
  end
end
