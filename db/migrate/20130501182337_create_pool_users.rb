class CreatePoolUsers < ActiveRecord::Migration
  def change
    create_table :pool_users do |t|
      t.integer :user_id
      t.integer :pool_id

      t.timestamps
    end
  end
end
