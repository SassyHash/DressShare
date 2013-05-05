class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :name
      t.integer :admin_id
      t.integer :school_id

      t.timestamps
    end
  end
end
