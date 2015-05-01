class AddpromotionvalueToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :promotevalue, :int
    add_column :articles, :promoted, :boolean
  end
end
