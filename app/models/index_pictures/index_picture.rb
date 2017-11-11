class IndexPicture < ApplicationRecord
  mount_uploader :file, IndexPicturesUploader

  validates_presence_of :file
end
