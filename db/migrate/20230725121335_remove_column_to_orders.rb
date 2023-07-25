class RemoveColumnToOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :product_name, :price
  end
end
