class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :identifier, null: false
      t.string :name, null: false
      t.text :description
      t.integer :task_id, null: false

      t.timestamps
    end
  end
end
