# Author:Mohammed El-Ansary
# 5.4.2015
# Joining magazines to users
class CreateMagazineUserJoin < ActiveRecord::Migration
  def change
    create_table :magazines_users do |t|
<<<<<<< HEAD
      t.column 'magazine_id', :integer
      t.column 'user_id', :integer
=======
      t.column :magazine_id, :integer
      t.column :user_id, :integer
>>>>>>> ecee245503362cc428fc50fb9b1eeef0823cbac6
    end
  end
end
