class Rental < ActiveRecord::Base
  attr_accessible :dress_id, :end_date, :start_date, :user_id
end
