class Dress < ActiveRecord::Base
  attr_accessible :body_type_id, :brand, :color, :notes, :owner_id, :photo_blob, :rent, :size
end
