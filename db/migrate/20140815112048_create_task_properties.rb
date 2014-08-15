class CreateTaskProperties < ActiveRecord::Migration
  def change
    create_table :task_properties do |t|
      t.integer :task_id
      t.integer :region_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
