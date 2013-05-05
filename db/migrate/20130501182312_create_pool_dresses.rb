class CreatePoolDresses < ActiveRecord::Migration
  def change
    create_table :pool_dresses do |t|
      t.integer :dress_id
      t.integer :pool_id

      t.timestamps
    end
  end
end
