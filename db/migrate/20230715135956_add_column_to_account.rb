class AddColumnToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :role, :integer
  end
end
