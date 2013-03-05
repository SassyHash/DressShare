class Search <<ActiveRecord::Base
  attr_accessible :body_type_ids, :brand, :color, :max_rent, :min_rent, :sizes

  def initialize(options)
    self.body_type_ids, self.sizes = [], []

    if options[:body_type_ids]
      options[:body_type_ids].each do |body_type|
        self.body_type_ids << body_type
      end
    end

    if options[:sizes]
      options[:sizes].each do |size|
        self.sizes << size
      end
    end

    self.brand = options[:brand] if options[:brand]
    self.color = options[:color] if options[:color]
    min_rent = (options[:min_rent] ? options[:min_rent] : 0)
    max_rent = (options[:max_rent] ? options[:max_rent] : 0)
    self.rent = [min_rent, max_rent]
  end

end
