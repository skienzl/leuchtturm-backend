class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :identifier, null: false
      t.string :name, null: false
      t.text :description, null: false, default: ""
      t.integer :task_id, null: false

      t.timestamps
    end

    add_index :activities, :identifier, :unique => true
    add_index :activities, :task_id
  end
end
