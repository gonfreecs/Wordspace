class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.integer :user_id
      t.text :des

      t.timestamps null: false
    end
  end
end
