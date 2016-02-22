class CreateSummariesUsersJoin < ActiveRecord::Migration
  def change
    create_table :summaries_users do |t|
    	t.integer :summary_id
    	t.integer :user_id
    end
  end
end
