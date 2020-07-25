class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :customer, foreign_key: true
      t.references :post, foreign_key: true
      t.string :comment, null: false

      t.timestamps
    end
  end
end
