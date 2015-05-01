class AddDetailsToAd < ActiveRecord::Migration
  def change
    add_column :ads, :title, :string
  end
end
