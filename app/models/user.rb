class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy


  validates :name, presence: true

  #Paperclipの設定
  has_attached_file :image,
  	default_url: '/images/no_image_:style.png',
  	styles: { medium: "300x300>", thumb: "100x100>", tiny: "25x25>" },
    path: "#{Rails.root}/public/system/:class/image/:id.:style.:extension",
    url: "/system/:class/image/:id.:style.:extension"
  validates_attachment_content_type :image, content_type: /image/
end
