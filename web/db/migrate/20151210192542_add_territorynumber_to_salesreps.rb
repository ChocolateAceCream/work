class AddTerritorynumberToSalesreps < ActiveRecord::Migration
  def change
    add_column :salesreps, :territorynumber, :integer
  end
end
