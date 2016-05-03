class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :species
      t.string :breed

      t.timestamps null: false
    end
  end
end
