# Author: Omar Essam
# created at: 9/4/2015
# model for ads every ad belongs to a user
# arguments are: title, user_id,&  description
class Ad < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :des, presence: true
end
