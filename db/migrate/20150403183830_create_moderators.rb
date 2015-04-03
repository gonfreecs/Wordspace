class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|

      t.timestamps null: false
    end
  end
end
