class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ""
      t.integer :next_id
      t.integer :prev_id
      t.float :lat, null: false
      t.float :lon, null: false
      t.integer :technology, null: false
      t.integer :accuracy
      t.string :identifier
      t.integer :minor
      t.integer :major
      t.text :shape
      t.integer :collection_id
      t.integer :task_id
      t.timestamps
      t.integer :scope_id, null: false
    end

    add_index :zones, :identifier
    add_index :zones, :lat
    add_index :zones, :lon
    add_index :zones, :task_id
    add_index :zones, :collection_id
    add_index :zones, :scope_id
  end
end
