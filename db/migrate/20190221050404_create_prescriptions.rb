class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :disease
      t.string :medicines
      t.string :dose
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
