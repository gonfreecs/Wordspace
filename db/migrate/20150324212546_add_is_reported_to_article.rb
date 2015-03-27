class AddIsReportedToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :is_reported, :boolean
  end
end
