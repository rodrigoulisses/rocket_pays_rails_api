module RocketPaysRailsApi
  class Request < Base
    # Set link
    attr_accessor :resource

    # Set params
    attr_accessor :params

    # return json
    def self.post!(options = {})
      self.new(options).post
    end

    def post
      request = Net::HTTP::Post.new(url.path)
      request.basic_auth RocketPaysRailsApi.email, RocketPaysRailsApi.token
      request.body = self.params
      request.content_type = "application/json"


      return JSON.parse(http_start(request).body)
    end

    private

    def url
      URI.parse("#{RocketPaysRailsApi.link}/#{self.resource}")
    end

    def use_ssl?
      RocketPaysRailsApi.production?
    end

    def http_start(request)
      Net::HTTP.start(url.host, url.port, use_ssl: use_ssl?) { |http| http.request(request) }
    end
  end
end
