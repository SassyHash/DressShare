class BodyTypeSearch < ActiveRecord::Base
  attr_accessible :body_type_id, :search_id
  belongs_to :search
  belongs_to :body_type
end
