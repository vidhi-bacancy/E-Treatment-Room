class AddPasswordToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :password, :string
  end
end
