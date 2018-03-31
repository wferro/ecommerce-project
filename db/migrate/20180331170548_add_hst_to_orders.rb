class AddHstToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :hst, :integer
  end
end
