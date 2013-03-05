class CreateSearches < ActiveRecord::Migration
  def up
    create_table :searches do |t|
      t.string :brand
      t.string :color
      t.integer :max_rent
      t.integer :min_rent

      t.timestamps
    end
  end

  def down
    drop_table :searches
  end
end
