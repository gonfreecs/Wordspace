class User < ActiveRecord::Base
  #many-to-many relation between user and comment
  #user can report many comments
  #comment can be reported by many users
  has_many :reportcomments
  has_many :comments, through: :reportcomments

	
  has_many :reportarticles
	has_many :articles, through: :reportarticles
# to upload avatar for user
 mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	#:recoverable,


 #making firstname and lastname required
 validates :firstname, :presence => true
 validates :lastname, :presence => true
 #adding relation between user and articles
 has_many :articles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	#:recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable


# to upload avatar for user
  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
