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
>>>>>>> 7693c4f1a04bb6d36a0b2109e941b06c2e89550f
    end
  end
end
