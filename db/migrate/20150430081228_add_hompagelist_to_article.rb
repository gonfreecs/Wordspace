class AddHompagelistToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :homepagelist, :boolean
  end
end
