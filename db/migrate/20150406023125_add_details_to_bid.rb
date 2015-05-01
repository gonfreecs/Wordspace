class AddDetailsToBid < ActiveRecord::Migration
  def change
    add_column :bids, :offer, :integer
  end
end
