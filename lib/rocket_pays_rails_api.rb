require 'json'
require 'active_model'
require 'enumerize'

require "rocket_pays_rails_api/version"

require "base"

require "rocket_pays_rails_api/invoice"
require "rocket_pays_rails_api/product"
require "rocket_pays_rails_api/config"

module RocketPaysRailsApi
  class << self

    extend Forwardable
    def_delegators :configuration, :email, :token, :sandbox?, :production?
  end

  def self.configuration
    @configuration ||= RocketPaysRailsApi::Config.new
  end

  # Set configuration API.
  # RocketPaysRailsApi.configure do
  #   config.email = EMAIL
  #   config.token = TOKEN
  #   config.environment = :production or :sandbox
  # end
  def self.configure(&block)
    yield configuration
  end
end
