class CreateSalesreps < ActiveRecord::Migration
  def change
    create_table :salesreps do |t|
      t.integer :sales_rep_number
      t.string :sales_rep_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :mtd_sales
      t.string :ytd_sales
      t.string :mtd_commission
      t.string :ytd_commission
      t.string :commission_rate

      t.timestamps null: false
    end
  end
end
