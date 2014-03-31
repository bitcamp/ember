class CreateWaivers < ActiveRecord::Migration
  def change
    create_table :waivers do |t|
      t.string :emailk
      t.integer :user_id

      t.timestamps
    end
  end
end
