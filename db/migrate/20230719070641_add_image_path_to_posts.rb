class AddImagePathToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :image_path, :string
  end
end
