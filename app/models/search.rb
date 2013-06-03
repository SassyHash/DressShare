class Search < ActiveRecord::Base
  attr_accessible :brands, :colors, :sizes, :body_types, :max_rent, :min_rent, :rental, :sale 
  # has_many :size_searches
  # has_many :body_type_searches
  # has_many :body_types, :through => :body_type_searches

  # accepts_nested_attributes_for :size_searches
  # accepts_nested_attributes_for :body_type_searches
  # def initialize(options)

  # self.brand = options[:brand] if options[:brand]
  # self.color = options[:color] if options[:color]
  # min_rent = (options[:min_rent] ? options[:min_rent] : 0)
  # max_rent = (options[:max_rent] ? options[:max_rent] : 0)
  # self.rent = [min_rent, max_rent]
  # end
end
