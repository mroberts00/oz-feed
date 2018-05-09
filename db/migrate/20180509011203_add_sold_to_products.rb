class AddSoldToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sold, :boolean
  end
end
