    # Author: Omar Essam
    # created at: 1/4/2015
    # model for bids every bid belongs to a user and an article
    # arguments are user_id, article_id, offer, & ad_id, & status
    class Bid < ActiveRecord::Base
      enum status: [:accepted, :rejected, :pending]

      belongs_to :article, dependent: :destroy
      belongs_to :user, dependent: :destroy
      validates :user_id, presence:  true
      validates :article_id, presence: true
      validates :ad_id, presence: true
      validates_numericality_of :offer, greater_than: 0
    end
