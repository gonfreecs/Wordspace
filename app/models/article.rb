# Article Model
class Article < ActiveRecord::Base
  # adding The uploader to Image field
  # adding relation between user and articles
  acts_as_taggable
  acts_as_taggable_on :categories
  mount_uploader :image, ImgUploader
  # mohab
  # 1.4.2015
  #  each article belongs to  user
  belongs_to :user
  validates :user_id, presence: true
  # Alias for acts_as_taggable_on :tags
  acts_as_taggable

  # Check if image size is larger than 5 MB
  def image_size
    errors[:image] << 'should be less than 5MB' if image.size > 5.megabytes
  end
  # mohab
  # 1.4.2015
  # writer must write tags
  validates :tag_list, presence: true
  validates :title, presence: true
  validates :image, presence: true
  validate :image_size
  has_many :comments, dependent: :destroy
end
