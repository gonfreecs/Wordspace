class AdjustingDefaultValueSponsor < ActiveRecord::Migration
  def change
    change_column :articles, :is_sponsored, :boolean, :default=>false
  end
end
