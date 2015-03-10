class AddIsSponsor2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_sponsor, :integer, default: 0
  end
end
