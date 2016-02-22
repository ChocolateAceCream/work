class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.date :date
      t.integer :part_number
      t.integer :qutity
      t.integer :price
      t.string :customer

      t.timestamps null: false
    end
  end
end
