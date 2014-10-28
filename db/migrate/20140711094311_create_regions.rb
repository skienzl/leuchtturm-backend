class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
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
      t.integer :harbor_id, null: false
    end

    add_index :regions, :identifier
    add_index :regions, :lat
    add_index :regions, :lon
    add_index :regions, :task_id
    add_index :regions, :collection_id
    add_index :regions, :harbor_id
  end
end
