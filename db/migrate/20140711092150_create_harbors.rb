class CreateHarbors < ActiveRecord::Migration
  def change
    create_table :harbors do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ""

      t.timestamps
    end

    add_index :harbors, :name, :unique => true
  end
end
