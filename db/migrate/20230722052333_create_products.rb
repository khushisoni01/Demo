class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.references :account, foreign_key: true, null: false

      t.timestamps
    end
  end
end
