class CreateOrderSummaries < ActiveRecord::Migration[5.1]
  def change
    create_table :order_summaries do |t|
      t.integer :order_id
      t.integer :product_id
      t.float :quantity
      t.string :payment_mode
      t.string :add_ons

      t.timestamps
    end
  end
end
