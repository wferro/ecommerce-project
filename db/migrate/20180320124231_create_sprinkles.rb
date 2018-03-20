class CreateSprinkles < ActiveRecord::Migration[5.1]
  def change
    create_table :sprinkles do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
