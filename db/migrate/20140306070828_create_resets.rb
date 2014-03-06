class CreateResets < ActiveRecord::Migration
  def change
    create_table :resets do |t|
      t.string :token
      t.integer :user_id

      t.timestamps
    end
  end
end
