class BodyTypeDress < ActiveRecord::Base
  attr_accessible :body_type_id, :dress_id

  belongs_to :dress
  belongs_to :body_type

end
