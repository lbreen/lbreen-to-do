class AddUserAndCategoryToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :user, index: true
    add_foreign_key :tasks, :users
    add_column :tasks, :category, :string, default: "General", null: false
  end
end
