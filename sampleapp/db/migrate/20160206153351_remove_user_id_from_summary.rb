class RemoveUserIdFromSummary < ActiveRecord::Migration
  def change
    remove_column :summaries, :user_id, :integer
  end
end
