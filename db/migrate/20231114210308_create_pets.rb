class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.boolean :adoptable, default: true
      t.string :breed
      t.string :name
      t.references :shelter, null: false, foreign_key: true
      t.timestamps
    end
  end
end
