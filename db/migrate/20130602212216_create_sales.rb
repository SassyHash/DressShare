class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :user_id
      t.integer :dress_id
      t.boolean :accepted, :default => false
      t.timestamps
    end
  end
end
