class AddaThirdColumn < ActiveRecord::Migration
  def change
  add_column :bids, :ad_id, :integer
  end
end
