class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :vendor_number
      t.string :vendor_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :vendor_part_number
      t.integer :part_charges
      t.integer :minimum_order
      t.date :deliver_date

      t.timestamps null: false
    end
  end
end
