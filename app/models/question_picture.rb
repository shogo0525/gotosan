class QuestionPicture < ActiveRecord::Base
	belongs_to :question
	
  #Paperclipの設定
  has_attached_file :image,
  	#default_url: '/images/no_image_:style.png',
  	styles: { medium: "300x300>", thumb: "100x100>", tiny: "25x25>" },
    path: "#{Rails.root}/public/system/:class/image/:id.:style.:extension",
    #path: "#{Rails.root}/public/system/:class/:id/:attachment/:style.:extension",
    url: "/system/:class/image/:id.:style.:extension"
  validates_attachment_content_type :image, content_type: /image/
end
