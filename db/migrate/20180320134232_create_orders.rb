class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.string :paymentInfo
      t.string :status
      t.integer :total
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
