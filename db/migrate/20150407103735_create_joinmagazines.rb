class CreateJoinmagazines < ActiveRecord::Migration
  def change
    create_table :joinmagazines do |t|
      t.references :user, index: true
      t.references :magazine, index: true

      t.timestamps null: false
    end
    add_foreign_key :joinmagazines, :users
    add_foreign_key :joinmagazines, :magazines
  end
end
