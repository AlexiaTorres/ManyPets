class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.integer :category
      t.boolean :alive
      t.references :developer, foreign_key: true

      t.timestamps
    end
  end
end
