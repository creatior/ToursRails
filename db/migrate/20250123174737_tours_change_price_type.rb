class ToursChangePriceType < ActiveRecord::Migration[8.0]
  def change
    change_column :tours, :price, :integer
  end
end
