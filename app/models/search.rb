class Search < ActiveRecord::Base
  attr_accessible :body_type_ids, :brand, :color, :end_date, :max_rent, :min_rent, :sizes, :start_date
end
