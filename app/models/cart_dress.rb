class CartDress < ActiveRecord::Base
  attr_accessible :cart_id, :dress_id

  belongs_to :cart
  belongs_to :dress
end
