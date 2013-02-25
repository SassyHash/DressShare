class CreateDresses < ActiveRecord::Migration
  def change
    create_table :dresses do |t|
      t.integer :body_type_dress_id
      t.integer :owner_id
      t.string :brand
      t.string :color
      t.integer :size
      t.text :notes
      t.integer :rent
      t.binary :photo_blob

      t.timestamps
    end
  end
end
