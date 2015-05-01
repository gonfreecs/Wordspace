# Author: Mohammed El-Ansary
# 1.4.2015
# Plain text body to be used in search
class AddPlainBodyToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :plain_body, :text
  end
end
