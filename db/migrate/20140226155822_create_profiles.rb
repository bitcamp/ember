class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first
      t.string :last
      t.string :school
      t.string :website
      t.string :github
      t.text :blurb
      t.integer :user_id

      t.timestamps
    end
  end
end
