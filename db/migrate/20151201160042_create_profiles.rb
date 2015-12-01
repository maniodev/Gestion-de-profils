class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :nom
      t.string :prenom
      t.string :dob
      t.string :avatar
      t.text :address
      t.text :about

      t.timestamps null: false
    end
  end
end
