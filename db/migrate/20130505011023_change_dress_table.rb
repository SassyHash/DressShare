class ChangeDressTable < ActiveRecord::Migration
  def up
  	change_table :dresses do |t|
      t.attachment :photo1
      t.attachment :photo2
      t.attachment :photo3
    end
  end

  def down
    drop_attached_file :dresses, :photo
  end
end
