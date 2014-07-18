class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.integer :in_id
      t.integer :out_id
      t.integer :task_id, null: false
      t.timestamps
    end
  end
end
