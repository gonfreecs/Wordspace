class CreateReportcomments < ActiveRecord::Migration
  def change
    create_table :reportcomments do |t|
      t.references :comment, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :reportcomments, :comments
    add_foreign_key :reportcomments, :users
  end
end
