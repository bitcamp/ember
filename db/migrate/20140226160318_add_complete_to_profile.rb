class AddCompleteToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :complete, :boolean
  end
end
