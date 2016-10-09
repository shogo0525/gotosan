class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :name, presence: true, length: { in: 2..20 } 

  mount_uploader :avatar, AvatarUploader

  def update_with_password(params, * options)
		if params[:password].blank?
			params.delete(:password)
			params.delete(:password_confirmation) if params[:password_confirmation].blank?
		end
		update_attributes(params, * options)
	end
end
