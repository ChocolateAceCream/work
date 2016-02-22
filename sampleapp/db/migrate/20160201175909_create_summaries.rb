class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :name
      t.integer :site_id
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
