class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :zone_id, null: false
      t.string :key, null: false
      t.string :value, null: false

      t.timestamps
    end

    add_index :settings, :key
    add_index :settings, :zone_id
  end
end
