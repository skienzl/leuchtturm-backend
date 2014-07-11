class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.integer :region_id, null: false

      t.timestamps
    end
  end
end
