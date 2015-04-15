class CreateReportarticles < ActiveRecord::Migration
  def change
    create_table :reportarticles do |t|
      t.references :user, index: true
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :reportarticles, :users
    add_foreign_key :reportarticles, :articles
  end
end
