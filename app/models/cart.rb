class Cart < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many :cart_dresses
  has_many :dresses, :through => :cart_dresses

  # before_save :converge_cart

  def converge_cart
  end
end
