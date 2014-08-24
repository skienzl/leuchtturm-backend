class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :key, null: false
      t.string :description, null: false, default: ""
      t.integer :activity_id, null: false

      t.timestamps
    end

    add_index :properties, :key
    add_index :properties, :activity_id
  end
end
