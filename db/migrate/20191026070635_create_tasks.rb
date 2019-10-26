class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due_at
      t.boolean :completed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tasks, :due_at
    add_index :tasks, :completed, where: "completed = false" # use partail index for performance benifits
  end
end
