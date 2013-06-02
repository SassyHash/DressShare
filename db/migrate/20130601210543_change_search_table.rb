class ChangeSearchTable < ActiveRecord::Migration
  def change
    rename_column :searches, :size_searches, :sizes
    rename_column :searches, :body_type_searches, :body_types
    rename_column :searches, :brand, :brands
    rename_column :searches, :color, :colors
  end

  def down
  end
end
