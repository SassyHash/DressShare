class RemoveBodyTypeDressesFromDresses < ActiveRecord::Migration
  def change
    remove_column :dresses, :body_type_dress_id
  end
end
