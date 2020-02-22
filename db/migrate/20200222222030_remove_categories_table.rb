class RemoveCategoriesTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tasks, :category
    drop_table :categories
  end
end
