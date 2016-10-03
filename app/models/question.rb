class Question < ActiveRecord::Base
	validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :question_pictures, :dependent => :destroy
  has_many :answers, dependent: :destroy

  #acts_as_taggable_on :tags のエイリアス
	acts_as_taggable

end
