module RocketPaysRailsApi
  class Invoice < Base

    #Set number
    attr_accessor :number

    # Set invoice_description
    attr_accessor :invoice_description

    #Set customer name
    attr_accessor :customer_name

    # Set customer email
    attr_accessor :customer_email

    # Set discounts
    attr_accessor :discounts

    # Set currency
    attr_accessor :currency

    # Set shipping
    attr_accessor :delivery_fee

    # Set success_url
    attr_accessor :success_url

    # Set cancel_url
    attr_accessor :cancel_url

    # Set products
    attr_accessor :products

    validates :number, :invoice_description, :customer_email, :customer_name, :success_url, :cancel_url, presence: true
    validate :products_not_empty

    def initialize(options = {})
      @number = options[:number]
      @invoice_description = options[:invoice_description]
      @customer_name = options[:customer_name]
      @customer_email = options[:customer_email]
      @currency = options[:currency] || 'USD'
      @discounts = options[:discounts] || 0.0
      @delivery_fee = options[:delivery_fee] || 0.0
      @success_url = options[:success_url]
      @cancel_url = options[:cancel_url]
      @products = []
    end

    def to_json
      JSON.generate to_hash
    end

    def add_product(product)
      @products.push product
    end

    private

    def to_hash
      {
        invoice: {
          invoiceNumber: @number,
          invoiceDescription: @invoice_description,
          customerName: @customer_name,
          customerEmail: @customer_email,
          invoiceDiscounts: @discounts,
          invoiceCurrency: @currency,
          invoiceDeliveryFee: @delivery_fee,
          invoiceProducts: @products.map { |product| product.to_hash}
        },
        successUrl: @success_url,
        cancelUrl: @cancel_url
      }
    end

    def products_not_empty
      return nil if @products.any?

      errors.add(:products, 'Products should not be empty')
    end
  end
end
