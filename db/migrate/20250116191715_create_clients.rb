class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :patronymic
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
