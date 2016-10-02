class AddAnonymToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :anonym, :boolean , default: false
  end
end
