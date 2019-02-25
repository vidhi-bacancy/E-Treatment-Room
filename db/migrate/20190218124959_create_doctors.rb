class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialist
      t.string :experience
      t.string :clinicaddress
      t.integer :cliniccno

      t.timestamps
    end
  end
end
