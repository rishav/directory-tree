class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.string :name
      t.integer :parent_id, index: true
      t.timestamps
    end
  end
end
