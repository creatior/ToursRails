class CreateTours < ActiveRecord::Migration[8.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :description
      t.integer :duration
      t.decimal :price, precision: 6, scale: 2

      t.timestamps
    end
  end
end
