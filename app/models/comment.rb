class Comment < ActiveRecord::Base
	# A comment belongs to an Article and has many replies and has a field for description
	belongs_to :article
	validates_presence_of :des 
  validates_length_of :des, :within => 1..500 
  has_many :replies, :dependent => :destroy
	 
end
