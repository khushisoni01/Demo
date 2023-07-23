class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :product_name
      t.integer :price
      t.string :address
      t.references :account, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
    
    

      t.timestamps
    end
  end
end
