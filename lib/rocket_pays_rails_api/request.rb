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

    def self.get!(options = {})
      self.new(options).get
    end

    def post
      @url = URI.parse("#{RocketPaysRailsApi.link}/#{self.resource}")

      request = Net::HTTP::Post.new(@url.path)
      request.basic_auth RocketPaysRailsApi.email, RocketPaysRailsApi.token
      request.body = self.params
      request.content_type = "application/json"

      return JSON.parse(http_start(request).body)
    end

    def get
      @url = URI.parse("#{RocketPaysRailsApi.link}/#{self.resource}/#{self.params}")
      
      request = Net::HTTP::Get.new(@url.path)
      request.basic_auth RocketPaysRailsApi.email, RocketPaysRailsApi.token
      request.content_type = "application/json"

      return JSON.parse(http_start(request).body)
    end

    private

    def use_ssl?
      RocketPaysRailsApi.production?
    end

    def http_start(request)
      Net::HTTP.start(@url.host, @url.port, use_ssl: use_ssl?) { |http| http.request(request) }
    end
  end
end
