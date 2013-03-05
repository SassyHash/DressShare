class CreateSizeSearches < ActiveRecord::Migration
  def change
    create_table :size_searches do |t|
      t.integer :size
      t.integer :search_id

      t.timestamps
    end
  end
end
