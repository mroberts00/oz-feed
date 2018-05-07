class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :length, :integer
    add_column :products, :width, :integer
    add_column :products, :height, :integer
    add_column :products, :weight, :integer
    add_column :products, :cost_price, :decimal
  end
end
