class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.references :order
      t.references :product
      t.decimal    :price, :scale => 2
      t.integer    :quantity
      t.timestamps
    end
  end
end
