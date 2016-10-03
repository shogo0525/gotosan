class AddAttachmentImageToQuestionPicture < ActiveRecord::Migration
  def change
  	add_attachment :question_pictures, :image
  end
end
