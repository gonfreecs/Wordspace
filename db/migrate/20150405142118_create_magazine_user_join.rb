# Author:Mohammed El-Ansary
# 5.4.2015
# Joining magazines to users
class CreateMagazineUserJoin < ActiveRecord::Migration
  def change
    create_table :magazines_users do |t|
      t.column 'magazine_id', :integer
      t.column 'user_id', :integer

    end
  end
end
