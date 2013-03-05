class CreateBodyTypeSearches < ActiveRecord::Migration
  def change
    create_table :body_type_searches do |t|
      t.integer :body_type_id
      t.integer :search_id

      t.timestamps
    end
  end
end
