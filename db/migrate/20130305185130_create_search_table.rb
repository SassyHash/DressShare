class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :brand
      t.string :color
      t.integer :max_rent
      t.integer :min_rent

      t.timestamps
    end
  end
end
