require 'spec_helper'

RSpec.describe RocketPaysRailsApi::Config, type: :model do
  describe '#link' do
    context 'when environment is sandbox' do
      before do
        subject.environment = :sandbox
      end

      it 'return sandbox link' do
        expect(subject.link).to eql 'http://api.sandbox.rocketpays.com'
      end
    end

    context 'when environment is production' do
      before do
        subject.environment = :production
      end

      it 'return production link' do
        expect(subject.link).to eql 'https://api.rocketpays.com'
      end
    end
  end
end
