class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :description, limit: 200
      t.boolean :completed

      t.timestamps
    end
  end
end
