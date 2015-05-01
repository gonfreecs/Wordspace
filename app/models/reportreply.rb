class Reportreply < ActiveRecord::Base
  belongs_to :user
  belongs_to :reply
end
