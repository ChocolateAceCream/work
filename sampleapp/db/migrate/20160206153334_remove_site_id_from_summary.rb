class RemoveSiteIdFromSummary < ActiveRecord::Migration
  def change
    remove_column :summaries, :site_id, :integer
  end
end
