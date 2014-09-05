class CreateTaskProperties < ActiveRecord::Migration
  def change
    create_table :task_properties do |t|
      t.integer :region_id, null: false
      t.string :key, null: false
      t.string :value, null: false

      t.timestamps
    end

    add_index :task_properties, :key
    add_index :task_properties, :region_id
  end
end
