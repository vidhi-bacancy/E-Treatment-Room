class AddEmailToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :email, :string
  end
end
