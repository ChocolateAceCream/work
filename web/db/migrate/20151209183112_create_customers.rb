class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :number
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :mtd_sales
      t.string :ytd_sales
      t.integer :current_balance
      t.integer :credit_limit
      t.string :ship_to_addr

      t.timestamps null: false
    end
  end
end
