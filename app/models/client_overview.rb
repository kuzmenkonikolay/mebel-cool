class ClientOverview < ApplicationRecord
  mount_uploader :file, ClientOverviewUploader

  validates_presence_of :file, :review
end
