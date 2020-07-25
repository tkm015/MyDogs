class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :customer, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
