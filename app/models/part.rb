class Part < ApplicationRecord
  mount_uploader :file, AudioFileUploader

  validates :file, presence: true
end
