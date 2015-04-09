    class Bid < ActiveRecord::Base
      enum status: [ :accepted, :rejected, :pending ]

      belongs_to:article
      belongs_to:user
    end
