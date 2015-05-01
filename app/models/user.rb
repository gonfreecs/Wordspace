  # User Model
  class User < ActiveRecord::Base
    around_update :notify_system_if_notifier_is_changed

    # to upload avatar for user
    mount_uploader :avatar, AvatarUploader
    # Adds the Abilitiy To follow and be followed
    acts_as_followable
    acts_as_follower

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    #:recoverable,
    # making firstname and lastname required
    validates :firstname, presence: true
    validates :lastname, presence: true
    # adding relation between user and articles
    has_many :articles
    # Author: Omar Essam
    # created at: 4/4/2015
    # bids and ads relations
    has_many :bids, dependent: :destroy
    has_many :ads, dependent: :destroy
    has_and_belongs_to_many :magazines
    has_many :collaboration_invitation
    # has_many :magazines, through: :collaboration_invitation
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    #:recoverable,
    devise :database_authenticatable, :registerable,
           :rememberable, :trackable, :validatable
    # to upload avatar for user
    validates_integrity_of :avatar
    validates_processing_of :avatar

    private

    def notify_system_if_notifier_is_changed
      notifier_changed = self.notifier_changed?

      yield

      notify_system if notifier_changed
    end
    def notify_system
      @u = User.find(3)
      @u.firstname = 'm'
      @u.save
    end

  end
