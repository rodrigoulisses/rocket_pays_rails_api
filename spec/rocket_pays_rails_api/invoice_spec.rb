require 'spec_helper'

RSpec.describe RocketPaysRailsApi::Invoice, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :number }
    it { is_expected.to validate_presence_of :customer_name }
    it { is_expected.to validate_presence_of :customer_email }
    it { is_expected.to validate_presence_of :success_url }
    it { is_expected.to validate_presence_of :cancel_url }

    describe '#products_not_empty' do
      context 'when products is empty' do
        before do
          subject.products = []
        end

        it 'be invalid' do
          subject.valid?

          expect(subject.errors[:products]).to include 'Products should not be empty'
        end
      end

      context 'when products is not empty' do
        let!(:product) { double(:product) }

        before do
          subject.products.push(product)
        end

        it 'be valid' do
          subject.valid?

          expect(subject.errors[:products]).to_not include 'Products should not be empty'
        end
      end
    end
  end

  describe '#to_json' do
    let!(:product) { RocketPaysRailsApi::Product.new(description: 'Product 1', name: 'Product 1', unit_price: 100.0, quantity: 2) }
    let!(:product_two) { RocketPaysRailsApi::Product.new(description: 'Product 2', name: 'Product 2', unit_price: 100.98, quantity: 1) }

    before do
      subject.number = 'BD1234'
      subject.invoice_description = 'Description'
      subject.customer_name = 'Antonio Francisco'
      subject.customer_email = 'antonio@email.com'
      subject.discounts = 0.0
      subject.delivery_fee = 0.0
      subject.success_url = 'http://www.my-web-site.com/success_url'
      subject.cancel_url = 'http://www.my-web-site.com/cancel_url'
      subject.currency = 'R$'
      subject.products = [product, product_two]
    end

    it 'return a json with datas' do
      expect(subject.to_json).to eql %Q[{"number":"BD1234","invoiceDescription":"Description","customerName":"Antonio Francisco","customerEmail":"antonio@email.com","invoiceDiscounts":0.0,"invoiceCurrency":"R$","invoiceDeliveryFee":0.0,"success_url":"http://www.my-web-site.com/success_url","cancel_url":"http://www.my-web-site.com/cancel_url","invoiceProducts":[{"description":"Product 1","name":"Product 1","unitPrice":100.0,"quantity":2},{"description":"Product 2","name":"Product 2","unitPrice":100.98,"quantity":1}]}]
    end
  end
end
