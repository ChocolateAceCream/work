class AddPingToSite < ActiveRecord::Migration
  def change
    add_column :sites, :ping, :string
  end
end
