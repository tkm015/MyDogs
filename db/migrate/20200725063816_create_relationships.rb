class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :customer, foreign_key: true
      t.references :dog, foreign_key: true

      t.timestamps
    end
  end
end
