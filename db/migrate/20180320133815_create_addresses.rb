class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :location
      t.string :postal_code
      t.string :additional_info
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
