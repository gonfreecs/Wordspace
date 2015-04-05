# Reply Model
class Reply < ActiveRecord::Base
  # A Reply belongs to a comment and have a field for description

  belongs_to :comment
  validates_presence_of :des
  validates_length_of :des, within: 1..500
end
