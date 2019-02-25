class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.text :address
      t.integer :phoneno
      t.string :gender
      t.date :dob
      t.integer :age
      t.string :password

      t.timestamps
    end
  end
end
