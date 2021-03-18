class AddPriceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :price, :decimal, null: false, default: 0.00
  end
end
