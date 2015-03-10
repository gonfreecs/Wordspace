class RemoveIsSoponsorFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_soponsor, :integer
  end
end
