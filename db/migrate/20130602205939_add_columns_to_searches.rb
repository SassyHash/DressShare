class AddColumnsToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :rental, :boolean
    add_column :searches, :sale, :boolean
  end
end
