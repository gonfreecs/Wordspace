# Author: Mohammed El-Ansary
# 5.4.2015
# Magazines model
class Magazine < ActiveRecord::Base
  has_many :requestjoiningmagazines
  has_many :users, through: :requestjoiningmagazines

  # Author: Mohammed El-Ansary
  # 5.4.2015
  # The uploader to Image field
  # Relation between magazines and articles, users
  mount_uploader :image, ImgUploader
  has_many :articles
  has_and_belongs_to_many :users

  # Check if image size is larger than 5 MB
  def image_size
    errors[:image] << 'should be less than 5MB' if image.size > 5.megabytes
  end

  validates :name, presence: true
  validates :image, presence: true
  validate :image_size
end
