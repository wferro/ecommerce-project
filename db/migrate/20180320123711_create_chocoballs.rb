class CreateChocoballs < ActiveRecord::Migration[5.1]
  def change
    create_table :chocoballs do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
