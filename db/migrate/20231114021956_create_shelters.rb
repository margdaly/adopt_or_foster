class CreateShelters < ActiveRecord::Migration[7.0]
  def change
    create_table :shelters do |t|
      t.boolean :foster_program
      t.string :name
      t.string :city, default: 'Denver'

      t.timestamps
    end
  end
end
