class AddColumnToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :rental, :boolean
    add_column :dresses, :sale, :boolean
  end
end
