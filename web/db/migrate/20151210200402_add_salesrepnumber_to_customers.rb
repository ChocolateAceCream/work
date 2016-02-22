class AddSalesrepnumberToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :salesrepnumber, :integer
  end
end

class RenameTerritoriesToSummaries < ActiveRecord::Migration
  def change
    rename_table :territories, :summaries
  end
end
