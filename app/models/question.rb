class Question < ActiveRecord::Base
	validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy

  has_many :qthumbnails, dependent: :destroy
  accepts_nested_attributes_for :qthumbnails

  #acts_as_taggable_on :tags のエイリアス
	acts_as_taggable


end
