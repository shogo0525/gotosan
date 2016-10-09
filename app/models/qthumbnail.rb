class Qthumbnail < ActiveRecord::Base
  belongs_to :question

  mount_uploader :image, QathumbnailUploader
end
