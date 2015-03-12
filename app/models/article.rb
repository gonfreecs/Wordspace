class Article < ActiveRecord::Base
  #adding The uploader to Image field
  mount_uploader :image, ImgUploader
  #adding relation between user and articles
  belongs_to:user

  validates :title, :presence => true
  validates :image, :presence => true
end
