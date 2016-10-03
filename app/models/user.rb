class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :name, presence: true, length: { in: 2..20 } 

  #Paperclipの設定
  has_attached_file :image,
  	default_url: '/images/no_image_:style.png',
  	styles: { medium: "300x300>", thumb: "100x100>", tiny: "25x25>" },
    path: "#{Rails.root}/public/system/:class/image/:id.:style.:extension",
    #path: "#{Rails.root}/public/system/:class/:id/:attachment/:style.:extension",
    url: "/system/:class/image/:id.:style.:extension"
  validates_attachment_content_type :image, content_type: /image/

  def update_with_password(params, * options)
		if params[:password].blank?
			params.delete(:password)
			params.delete(:password_confirmation) if params[:password_confirmation].blank?
		end
		update_attributes(params, * options)
	end
end
