class DropCartDresses < ActiveRecord::Migration
  def change
    drop_table :cart_dresses

    create_table :cart_rentals do |t|
      t.integer :rental_id
      t.integer :cart_id
    end

  end
end
