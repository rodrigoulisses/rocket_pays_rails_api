module RocketPaysRailsApi
  class Config < Base
    extend Enumerize

    # Set email
    attr_accessor :email

    # Set token
    attr_accessor :token

    enumerize :environment, in: [:production, :sandbox], predicates: true

    def link
      self.sandbox? ? link_to_sandbox : link_to_production
    end

    private

    def link_to_sandbox
      "http://api.sandbox.rocketpays.com"
    end

    def link_to_production
      "https://api.rocketpays.com"
    end
  end
end
