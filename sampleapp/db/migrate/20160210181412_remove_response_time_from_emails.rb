class RemoveResponseTimeFromEmails < ActiveRecord::Migration
  def change
    remove_column :emails, :response_time, :float
  end
end
