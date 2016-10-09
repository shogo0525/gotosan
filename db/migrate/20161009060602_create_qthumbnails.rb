class CreateQthumbnails < ActiveRecord::Migration
  def change
    create_table :qthumbnails do |t|
      t.references :question, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
