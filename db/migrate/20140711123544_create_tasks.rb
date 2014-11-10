class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ""
      t.integer :scope_id, null: false

      t.timestamps
    end

    add_index :tasks, :scope_id
  end
end
