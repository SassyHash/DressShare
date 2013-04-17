class School < ActiveRecord::Base
  attr_accessible :domain, :school_name, :town, :state
  validates :domain, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :school_name, :presence => true, :uniqueness => {:case_sensitive => false}

  has_many :users
  has_many :dresses, :through => :users

end
