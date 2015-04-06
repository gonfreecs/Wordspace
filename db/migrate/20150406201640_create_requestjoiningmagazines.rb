class CreateRequestjoiningmagazines < ActiveRecord::Migration
  def change
    create_table :requestjoiningmagazines do |t|
      t.references :user, index: true
      t.references :magazine, index: true

      t.timestamps null: false
    end
    add_foreign_key :requestjoiningmagazines, :users
    add_foreign_key :requestjoiningmagazines, :magazines
  end
end
