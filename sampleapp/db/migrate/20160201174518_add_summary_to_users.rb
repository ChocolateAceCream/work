class AddSummaryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :summary_id, :integer
  end
end
