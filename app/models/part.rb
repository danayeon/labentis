class Part < ApplicationRecord
  mount_uploader :file, AudioFileUploader
end
