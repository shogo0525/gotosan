class Athumbnail < ActiveRecord::Base
  belongs_to :answer

  mount_uploader :image, QathumbnailUploader
end
