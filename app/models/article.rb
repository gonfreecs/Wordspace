<<<<<<< HEAD
# Article Model
class Article < ActiveRecord::Base
  # adding The uploader to Image field
  # adding relation between user and articles
  acts_as_taggable
  acts_as_taggable_on :categories
  mount_uploader :image, ImgUploader
  belongs_to :user
=======
  # Author: Omar Essam
  class Article < ActiveRecord::Base
    # adding The uploader to Image field
    # adding relation between user and articles
    mount_uploader :image, ImgUploader
    belongs_to :user
    has_many :bids, dependent: :destroy
    has_one :ad
    # Check if image size is larger than 5 MB
    def image_size
      errors[:image] << 'should be less than 5MB' if image.size > 5.megabytes
    end
>>>>>>> master

    validates :title, presence: true
    validates :image, presence: true
    validate :image_size
    has_many :comments, dependent: :destroy
  end
<<<<<<< HEAD

  validates :title, presence: true
  validates :image, presence: true
  validate :image_size
  has_many :comments, dependent: :destroy
end
=======
>>>>>>> master
