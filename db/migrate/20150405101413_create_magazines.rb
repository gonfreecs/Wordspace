# Author:Mohammed El-Ansary
# 5.4.2015
# Creating the magazines table
class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :name
      t.text :decription
      t.string :image

      t.timestamps null: false
    end
  end
end
