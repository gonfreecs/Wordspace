class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :artilce_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
