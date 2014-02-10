class CreatePreregisters < ActiveRecord::Migration
  def change
    create_table :preregisters do |t|
      t.string :email
      t.string :name
      t.string :university

      t.timestamps
    end
  end
end
