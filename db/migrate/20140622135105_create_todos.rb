class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :description
      t.boolean :completed
      t.references :user, index: true
      t.string :remember_created_at
      t.timestamps
    end
  end
end
