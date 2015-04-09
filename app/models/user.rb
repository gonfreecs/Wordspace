# User Model
class User < ActiveRecord::Base
  # to upload avatar for user
  mount_uploader :avatar, AvatarUploader
  has_many :magazines
  acts_as_follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable,

  has_many :collaboration_invitation
  has_many :magazines, through: :collaboration_invitation

  # making firstname and lastname required
  validates :firstname, presence: true
  validates :lastname, presence: true
  # adding relation between user and articles
  has_many :articles
  # Author: Mohammed El-Ansary
  # 5.4.2015
  # Adding relation between user and magazines
  has_and_belongs_to_many :magazines
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #:recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # to upload avatar for user
  validates_integrity_of :avatar
  validates_processing_of :avatar
end
