class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.integer :in_id
      t.integer :out_id
      t.integer :task_id, null: false
      t.timestamps
    end

    add_index :mappings, :in_id
    add_index :mappings, :out_id
    add_index :mappings, :task_id
  end
end
