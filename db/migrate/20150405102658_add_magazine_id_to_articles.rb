# Author:Mohammed El-Ansary
# 5.4.2015
# Adding column magazine id to articles
class AddMagazineIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :magazine_id, :int, default: 0
  end
end
