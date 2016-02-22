class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :number
      t.text :description
      t.integer :price
      t.integer :mtd_sales
      t.integer :ytd_sales
      t.integer :units_on_hand
      t.integer :units_allocated
      t.integer :reorder_point

      t.timestamps null: false
    end
  end
end
