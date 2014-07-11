class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.integer :data_type, null: false
      t.integer :port_type, null: false
      t.boolean :is_optional, default: 0
      t.integer :activity_id, null: false

      t.timestamps
    end
  end
end
