class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.references :dog_breed
      t.references :customer, foreign_key: true
      t.string :name, null: false
      t.date :date_of_birth, null: false
      t.boolean :sex, null: false
      t.string :introduction, null: false
      t.string :cover_image
      t.string :profile_image

      t.timestamps
    end
  end
end
