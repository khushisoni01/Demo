class RemovingImageField < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :image, :string
    remove_column :posts, :image_path, :string
  end
end
