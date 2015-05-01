class CreateReportreplies < ActiveRecord::Migration
  def change
    create_table :reportreplies do |t|
      t.references :user, index: true
      t.references :reply, index: true

      t.timestamps null: false
    end
    add_foreign_key :reportreplies, :users
    add_foreign_key :reportreplies, :replies
  end
end
