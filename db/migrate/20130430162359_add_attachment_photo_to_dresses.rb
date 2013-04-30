class AddAttachmentPhotoToDresses < ActiveRecord::Migration
  def self.up
    change_table :dresses do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :dresses, :photo
  end
end
