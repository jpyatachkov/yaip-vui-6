class CreateExamples < ActiveRecord::Migration[7.0]
  def change
    create_table :examples do |t|
      t.text :title
      t.boolean :used
      t.integer :count

      t.timestamps
    end
  end
end
