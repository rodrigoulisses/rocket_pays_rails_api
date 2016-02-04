require 'spec_helper'

describe RocketPaysRailsApi do
  it 'has a version number' do
    expect(RocketPaysRailsApi::VERSION).not_to be nil
  end

  describe '#configure' do
    before do
      RocketPaysRailsApi.configure do |config|
        config.email = "rocket@pays.com"
        config.token = "kdjuuhdsakjd2938dsjdjl"
        config.environment = :sandbox
      end
    end

    it 'email is present' do
      expect(RocketPaysRailsApi.email).not_to be nil
    end

    it 'email is equal to rocket@pays.com' do
      expect(RocketPaysRailsApi.email).to eql 'rocket@pays.com'
    end

    it 'token is present' do
      expect(RocketPaysRailsApi.token).not_to be nil
    end

    it 'token is equal to kdjuuhdsakjd2938dsjdjl' do
      expect(RocketPaysRailsApi.token).to eql 'kdjuuhdsakjd2938dsjdjl'
    end

    it 'environment is sandbox' do
      expect(RocketPaysRailsApi.sandbox?).to be true
    end

    it 'environment is not production' do
      expect(RocketPaysRailsApi.production?).to be false
    end
  end
end
