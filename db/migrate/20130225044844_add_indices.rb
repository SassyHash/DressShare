class AddIndices < ActiveRecord::Migration
  def change
    add_index :dresses, :owner_id
    add_index :dresses, :size
    add_index :rentals, :dress_id
    add_index :rentals, :user_id
    add_index :users, :email
  end

end
