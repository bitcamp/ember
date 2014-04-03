class DropTableForWaiver < ActiveRecord::Migration
  def change
  	drop_table :waivers
  end
end
