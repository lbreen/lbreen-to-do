class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.integer :status, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
