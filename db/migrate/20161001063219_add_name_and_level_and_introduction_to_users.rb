class AddNameAndLevelAndIntroductionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :level, :string
    add_column :users, :introduction, :string
  end
end
