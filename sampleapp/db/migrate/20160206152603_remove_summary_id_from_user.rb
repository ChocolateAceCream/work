class RemoveSummaryIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :summary_id, :integer
  end
end
