class AddAnotherColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :ad_title, :string
  end
end
