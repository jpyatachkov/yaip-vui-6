class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.text :title
      t.text :description
      t.boolean :done

      t.timestamps
    end
    add_index :todos, :title, unique: true
  end
end
