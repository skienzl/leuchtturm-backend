class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :key, null: false
      t.string :description
      t.integer :activity_id, null: false

      t.timestamps
    end
  end
end
