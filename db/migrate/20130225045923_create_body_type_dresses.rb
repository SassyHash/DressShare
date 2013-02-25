class CreateBodyTypeDresses < ActiveRecord::Migration
  def change
    create_table :body_type_dresses do |t|
      t.integer :body_type_id
      t.integer :dress_id

      t.timestamps
    end
  end
end
