class Picture < ApplicationRecord
  mount_uploader :file, PicturesUploader

  validates_presence_of :file
end
