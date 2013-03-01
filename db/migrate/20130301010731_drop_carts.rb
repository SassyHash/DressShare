class DropCarts < ActiveRecord::Migration
  def change
    drop_table :cart_rentals
    drop_table :carts
  end
end
