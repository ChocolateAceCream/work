class CreateRelationTerriSalesReps < ActiveRecord::Migration
  def change
    create_table :relation_terri_sales_reps do |t|
      t.integer :territory_id
      t.integer :sales_rep_id

      t.timestamps null: false
    end
  end
end
