class AddSendingTimeToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :sending_time, :float
  end
end
