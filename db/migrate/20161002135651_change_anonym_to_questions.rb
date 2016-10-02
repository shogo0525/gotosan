class ChangeAnonymToQuestions < ActiveRecord::Migration
  def change
    change_column :questions, :anonym, :boolean , default: false
  end
end
