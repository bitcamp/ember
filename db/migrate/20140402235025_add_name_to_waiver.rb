class AddNameToWaiver < ActiveRecord::Migration
  def change
    add_column :waivers, :name, :string
  end
end
