class Picture < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  mount_uploader :content, PictureUploader
end
