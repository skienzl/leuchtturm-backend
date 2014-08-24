class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ""
      t.integer :harbor_id, null: false

      t.timestamps
    end

    add_index :tasks, :harbor_id
  end
end
