class RentalsAddColumn < ActiveRecord::Migration
  def change
    add_column :rentals, :accepted, :boolean, :default => false
  end
end
