class User < ActiveRecord::Base
 mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	#:recoverable, 


 #making firstname and lastname required
 validates :firstname, :presence => true
 validates :lastname, :presence => true
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	#:recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable


  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
