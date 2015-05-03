class CreateReportarticles < ActiveRecord::Migration
  def change
    create_table :reportarticles do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :is_dismissed

      t.timestamps null: false
    end
  end
end
