class RemoveIsSponsorFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_sponsor, :integer
  end
end
