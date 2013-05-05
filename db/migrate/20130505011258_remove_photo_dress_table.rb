class RemovePhotoDressTable < ActiveRecord::Migration
  def up
  	drop_attached_file :dresses, :photo

  end

  def down
  end
end
