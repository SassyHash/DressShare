class CreateCartDresses < ActiveRecord::Migration
  def change
    create_table :cart_dresses do |t|
      t.integer :cart_id
      t.integer :dress_id

      t.timestamps
    end
  end
end
