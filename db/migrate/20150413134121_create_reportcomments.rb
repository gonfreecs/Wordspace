class CreateReportcomments < ActiveRecord::Migration
  def change
    create_table :reportcomments do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :is_dismissed

      t.timestamps null: false
    end
  end
end
