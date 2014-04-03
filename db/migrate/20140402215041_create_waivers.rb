class CreateWaivers < ActiveRecord::Migration
  def change
    create_table :waivers do |t|
      t.boolean :agreed
      t.integer :user_id

      t.timestamps
    end
  end
end
