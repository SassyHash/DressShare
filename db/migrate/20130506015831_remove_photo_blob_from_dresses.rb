class RemovePhotoBlobFromDresses < ActiveRecord::Migration
  def change
  	remove_column :dresses, :photo_blob
  end
end
