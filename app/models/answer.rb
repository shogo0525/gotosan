class Answer < ActiveRecord::Base
	validates :content, presence: true
	belongs_to :user
  belongs_to :question
  has_many :athumbnails, dependent: :destroy
  accepts_nested_attributes_for :athumbnails
end
