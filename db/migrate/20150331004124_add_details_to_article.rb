class AddDetailsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :is_sponsored, :boolean
  end
end
