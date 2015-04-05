# mohab
# 1.4.2015
# User database
# has attribute boolean sponser , moderator and gender
# first and last name
# about me
class AddIsSponsorToUsers < ActiveRecord::Migration
  def change
    # adding extra columns to users table
    add_column :users, :is_sponsor, :integer, default: 0
    add_column :users, :is_moderator, :boolean, default: false
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :about_me, :text
    add_column :users, :is_female, :boolean, default: false
  end
end
