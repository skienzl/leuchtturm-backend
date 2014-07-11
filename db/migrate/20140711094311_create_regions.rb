class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name, null: false
      t.text :description
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
      t.integer :collection_id, null: false
      t.timestamps
    end
  end
end
