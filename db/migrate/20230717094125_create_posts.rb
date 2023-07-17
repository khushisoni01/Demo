class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :tag_people
      t.text :description
      t.references :account, foreign_key: true, null: false
      t.timestamps
    end
  end
end
