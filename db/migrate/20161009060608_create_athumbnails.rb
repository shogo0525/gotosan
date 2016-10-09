class CreateAthumbnails < ActiveRecord::Migration
  def change
    create_table :athumbnails do |t|
      t.references :answer, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
