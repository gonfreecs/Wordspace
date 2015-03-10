class AddIsSponsorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_soponsor, :integer, default: 0
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string

  end
end
