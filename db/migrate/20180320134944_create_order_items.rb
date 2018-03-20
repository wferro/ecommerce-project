class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :total
      t.references :order, foreign_key: true
      t.references :brigadeiro, foreign_key: true

      t.timestamps
    end
  end
end
