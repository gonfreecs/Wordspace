    # Author: Omar Essam
    # created at: 1/4/2015
    # model for bids every bid belongs to a user and an article
    # arguments are user_id, article_id, offer, & ad_id, & status
    class Bid < ActiveRecord::Base
      enum status: [:accepted, :rejected, :pending]

      belongs_to :article
      belongs_to :user
    end
