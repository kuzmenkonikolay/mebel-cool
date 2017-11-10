class Picture < ApplicationRecord
  mount_uploader :file, PicturesUploader
end
