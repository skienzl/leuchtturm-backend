class CreateHarbors < ActiveRecord::Migration
  def change
    create_table :harbors do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
