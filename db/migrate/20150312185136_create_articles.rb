
    class CreateArticles < ActiveRecord::Migration
      def change
        create_table :articles do |t|
          t.string :title
          t.text :body
          t.string :image
          t.references :user, index: true
          t.timestamps null: false
        end
        add_foreign_key :articles, :users
        add_index :articles, [:user_id, :created_at]
      end
    

