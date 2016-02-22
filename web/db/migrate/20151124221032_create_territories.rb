class CreateTerritories < ActiveRecord::Migration
  def change
    create_table :territories do |t|
      t.integer :number
      t.string :name

      t.timestamps null: false
    end
  end
end
