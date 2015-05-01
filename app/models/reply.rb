class Reply < ActiveRecord::Base
  # A many-to-many relationship between reply and user
  has_many :reportreplies
  has_many :users, through: :reportreplies
  # A Reply belongs to a comment and have a field for description

  belongs_to :comment
  validates_presence_of :des
  validates_length_of :des, within: 1..500
end
