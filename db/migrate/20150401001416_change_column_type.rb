# Author: Mohammed El-Ansary
# 1.4.2015
# Changed articles title from string to text to be used in search
class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :articles, :title, :text
  end
end
