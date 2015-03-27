class AddIsReportedToArticle < ActiveRecord::Migration
  def change
  end

  def self.up
  	add_column :article, :is_repoted, :boolean
end
