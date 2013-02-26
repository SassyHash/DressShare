class BodyType < ActiveRecord::Base
  attr_accessible :label

  has_many :body_type_dresses
  has_many :dresses, :through => :body_type_dresses

  validates :label, :presence => true

end
