class School < ActiveRecord::Base
  attr_accessible :domain, :name, :town, :state
  validates :domain, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}

  has_many :users
  has_many :dresses, :through => :users
end
