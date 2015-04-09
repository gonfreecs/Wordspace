  class User < ActiveRecord::Base
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
   has_many :bids
   has_many :ads
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
   	#:recoverable,
    devise :database_authenticatable, :registerable,
           :rememberable, :trackable, :validatable


  # to upload avatar for user
    validates_integrity_of  :avatar
    validates_processing_of :avatar
  end
