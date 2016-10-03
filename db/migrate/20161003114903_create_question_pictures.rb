class CreateQuestionPictures < ActiveRecord::Migration
  def change
    create_table :question_pictures do |t|
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
