class AddConfirmToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :confirm, :boolean, default: false
  end
end
