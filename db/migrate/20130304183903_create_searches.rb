class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :brand
      t.string :color
      t.string :sizes
      t.string :body_type_ids
      t.date :start_date
      t.date :end_date
      t.integer :min_rent
      t.integer :max_rent

      t.timestamps
    end
  end
end
