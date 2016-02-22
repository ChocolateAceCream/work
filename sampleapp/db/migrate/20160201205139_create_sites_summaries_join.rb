class CreateSitesSummariesJoin < ActiveRecord::Migration
	def change
		create_table :sites_summaries do |t|
			t.integer :site_id
			t.integer :summary_id
		end
	end
end
