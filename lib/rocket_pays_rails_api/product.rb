module RocketPaysRailsApi
  class Product < Base

    # Set description
    attr_accessor :description

    # Set name
    attr_accessor :name

    # Set unit price
    # Should be greater than zero
    attr_accessor :unit_price

    # Set quantity
    # Should be greater than zero
    attr_accessor :quantity

    validates :name, :description, :unit_price, :quantity, presence: true
    validates :unit_price, numericality: { greater_than: 0.0 }
    validates :quantity, numericality: { greater_than: 0 }

    def initialize(options = {})
      @description = options[:description]
      @name = options[:name]
      @unit_price = options[:unit_price]
      @quantity = options[:quantity] || 1
    end

    # Return json with data product
    def to_json
      JSON.generate to_hash
    end

    def to_hash
      {
        description: @description,
        name: @name,
        unitPrice: @unit_price.to_s,
        quantity: @quantity.to_s
      }
    end
  end
end
