class AddReceivingTimeToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :receiving_time, :float
  end
end
