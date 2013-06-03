class Dress < ActiveRecord::Base
  attr_accessible :body_type_ids, :brand, :color, :notes, 
  :owner_id, :photo1, :photo2, :photo3,
  :rent, :size, :updated_at, :rental, :sale

  attributes = [:color, :rent, :size]
  
  attributes.each do |a|
    validates a, :presence => true
  end
  validates_attachment_presence :photo1

  before_save :cleanup_brand_and_color

  has_many :rentals
  has_many :sales

  has_many :body_type_dresses
  has_many :body_types, :through => :body_type_dresses
  belongs_to :owner, :class_name => 'User', :foreign_key => :owner_id
  
  photos = [:photo1, :photo2, :photo3]

  photos.each do |photo_attr|
    has_attached_file photo_attr, 
      :styles => {:medium => "500x500>",  
                  :small => "300x300>", 
                  :thumb => "150x150>" }, 
      :default_url => "/images/:dress/#{photo_attr}.png"
    validates_attachment_size photo_attr, :less_than => 5.megabytes
    validates_attachment_content_type photo_attr, :content_type => ['image/jpeg', 'image/png']
  end

  SIZES = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18 ]

  default_scope order('updated_at DESC')
  scope :most_recent, order('updated_at DESC')
  scope :by_size, lambda { |size| where(:size => size) }
  scope :by_brands, lambda { |brand| where(:brands => brand) }
  scope :by_colors, lambda { |color| where(:colors => color) }
  scope :by_body_types, lambda { |body_type_ids| joins(:body_type_dresses)
    .where(:body_type_dresses => {:body_type_id => body_type_ids})}
  scope :by_min_rent, lambda { |min_rent| where('rent >= ?', min_rent)}
  scope :by_max_rent, lambda { |max_rent| where('rent <= ?', max_rent)}
  scope :price_low_high, order('rent')
  scope :rentals, lambda { where(:rental => true)}
  scope :sales, lambda {where(:sale => true)}

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

  def self.search(params)
    dresses = Dress
    # params[:size].each {|s| s.to_i}
    dresses = dresses.by_brands(params[:brands]) unless params[:brands].blank?
    dresses = dresses.by_colors(params[:colors]) unless params[:colors].blank?
    
    dresses = dresses.by_body_types(params[:body_types]) unless params[:body_types].blank?
    dresses = dresses.by_size(params[:sizes]) unless params[:sizes].blank?
    # params[:sizes].each {|size| dresses.by_sizes(size.to_i)}
    dresses = dresses.by_min_rent(params[:min_rent]) unless params[:min_rent].blank?
    dresses = dresses.by_max_rent(params[:max_rent]) unless params[:max_rent].blank?
    dresses = dresses.rentals if params[:rental]
    dresses = dresses.sales if params[:sales]
    dresses.all
  end


end
