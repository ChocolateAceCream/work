class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :server_name
      t.string :imap
      t.integer :imap_port
      t.string :smtp
      t.integer :smtp_port
      t.string :account_name
      t.string :account_password
      t.float :response_time

      t.timestamps null: false
    end
  end
end
