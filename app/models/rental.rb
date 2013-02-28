class Rental < ActiveRecord::Base
  attr_accessible :dress_id, :end_date, :start_date, :user_id

  validates :end_date, :presence => true
  validates :start_date, :presence => true
  validates :dress_id, :uniqueness => { :scope => [:start_date, :end_date], :message => "This dress is already rented for those days."}

  belongs_to :dress
  belongs_to :user
end
