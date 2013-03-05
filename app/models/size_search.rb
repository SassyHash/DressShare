class SizeSearch < ActiveRecord::Base
  attr_accessible :search_id, :size
  belongs_to :search
end
