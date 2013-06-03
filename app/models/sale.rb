class Sale < ActiveRecord::Base
  attr_accessible :accepted, :dress_id, :user_id

  belongs_to :user
  belongs_to :dresses

  has_one :owner, :through => :dress
end
