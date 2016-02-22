class CreateEmailsSummaries < ActiveRecord::Migration
  def change
    create_table :emails_summaries do |t|
    	t.integer :email_id
    	t.integer :summary_id
    end
  end
end
