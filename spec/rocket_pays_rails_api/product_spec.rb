require 'spec_helper'

describe RocketPaysRailsApi::Product, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :unit_price }
    it { is_expected.to validate_presence_of :quantity }

    it { is_expected.to validate_numericality_of(:unit_price).is_greater_than(0.0) }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than(0) }
  end

  describe '#to_json' do
    it 'return a json with datas' do
      subject.description = 'Macbook Air 11'
      subject.name = 'Macbook Air 11'
      subject.unit_price = 1000.00
      subject.quantity = 1

      expect(subject.to_json).to eql "{\"description\":\"Macbook Air 11\",\"name\":\"Macbook Air 11\",\"unitPrice\":1000.0,\"quantity\":1}"
    end
  end

  describe '#to_hash' do
    it 'return a hash with data' do
      subject.description = 'Macbook Air 11'
      subject.name = 'Macbook Air 11'
      subject.unit_price = 1000.00
      subject.quantity = 1

      expect(subject.to_hash).to eql({description:"Macbook Air 11",name:"Macbook Air 11",unitPrice:1000.0,quantity:1})
    end
  end
end
