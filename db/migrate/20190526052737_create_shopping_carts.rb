class CreateShoppingCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_carts do |t|
      t.string :user_name
      t.datetime :order_date
      t.integer :ticket_quantity
      t.integer :total_paid

      t.timestamps
    end
  end
end
