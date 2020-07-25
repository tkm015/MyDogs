class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :customer, foreign_key: true
      t.references :dog, foreign_key: true
      t.string :title, null: false
      t.text :text, null: false
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end
