class Dress < ActiveRecord::Base
  attr_accessible :body_type_ids, :brand, :color, :notes, :owner_id, :photo_blob, :rent, :size

  validates :color, :presence => true
  validates :rent, :presence => true
  validates :size, :presence => true
  validates :photo_blob, :presence => true

  # before_save :convert_dollars
  before_save :cleanup_brand_and_color

  has_many :body_type_dresses
  has_many :body_types, :through => :body_type_dresses

  has_many :cart_rentals
  has_many :carts, :through => :cart_rentals


  SIZES = [0, 2, 4, 6, 8, 10, 12, 14, 16]
  def convert_dollars
    self.rent = rent*100
  end

  def body_types_string
    labels = []
    self.body_types.each do |body_type|
      labels << body_type.label
    end
    labels.join(", ")
  end

  def cleanup_brand_and_color
    self.brand = brand.capitalize.chomp
    self.color = color.capitalize.chomp
  end

end
