class Dress < ActiveRecord::Base
  attr_accessible :body_type_ids, :brand, :color, :notes, :owner_id, :photo_blob, :rent, :size, :updated_at

  validates :color, :presence => true
  validates :rent, :presence => true
  validates :size, :presence => true
  validates :photo_blob, :presence => true

  # before_save :convert_dollars
  before_save :cleanup_brand_and_color

  has_many :body_type_dresses
  has_many :body_types, :through => :body_type_dresses
  belongs_to :owner, :class_name => 'User', :foreign_key => :owner_id

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

  def self.most_recent
    Dress.order("updated_at DESC")
  end

  def self.search_by_body_types(body_type_ids)
    dresses = []
    body_type_ids.each do |body_type|
      dresses << Dress.joins(:body_types)
        .where("body_type_id = ?", body_type)
    end
    dresses
    # dresses.sort! {|first, second| second.updated_at <=> first.updated_at}
  end

  def self.search_by_size(sizes)
    dresses = []
    sizes.each do |size|
      dresses << Dress.where('size = ?', size)
    end
    dresses
  end

  def self.price_low_to_high
    Dress.order("rent")
  end

  def self.
end
