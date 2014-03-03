class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :tshirt, :string
    add_column :profiles, :dietary, :string
    add_column :profiles, :travel, :string
    add_column :profiles, :stipend, :boolean
    add_column :profiles, :resume, :string
    add_column :profiles, :notes, :string
  end
end
