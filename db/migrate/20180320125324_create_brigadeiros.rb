class CreateBrigadeiros < ActiveRecord::Migration[5.1]
  def change
    create_table :brigadeiros do |t|
      t.string :name
      t.string :description
      t.string :image
      t.references :chocoball, foreign_key: true
      t.references :sprinkle, foreign_key: true

      t.timestamps
    end
  end
end
