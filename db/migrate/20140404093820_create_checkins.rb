class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.boolean :checkedin
      t.integer :user_id

      t.timestamps
    end
  end
end
