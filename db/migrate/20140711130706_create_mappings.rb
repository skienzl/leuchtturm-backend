class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.integer :in_id
      t.integer :out_id

      t.timestamps
    end
  end
end
