class AddAnonToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :anonymous, :boolean
  end
end
