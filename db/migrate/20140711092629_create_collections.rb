class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name, null: false
      t.text :description
      t.integer :harbor_id

      t.timestamps
    end
  end
end
