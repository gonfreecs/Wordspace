class FixBids < ActiveRecord::Migration
  def change
    rename_column :bids, :artilce_id, :article_id
  end
end
