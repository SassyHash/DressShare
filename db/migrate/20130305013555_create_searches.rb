class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :body_type_ids
      t.string :brand
      t.string :color
      t.integer :max_rent
      t.integer :min_rent
      t.string :sizes

      t.timestamps
    end
  end
end
