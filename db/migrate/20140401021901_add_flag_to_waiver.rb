class AddFlagToWaiver < ActiveRecord::Migration
  def change
    add_column :waivers, :flag, :boolean
  end
end
