module RocketPaysRailsApi
  class Request < Base
    # Set link
    attr_accessor :link

    # Set params
    attr_accessor :params

    # return redirect url to ewallet
    def self.post!(options = {})
      self.new(options).post
    end

    def post
      url = URI.parse("#{RocketPaysRailsApi.link}/#{self.link}")

      request = Net::HTTP::Post.new(url.path)
      request.basic_auth RocketPaysRailsApi.email, RocketPaysRailsApi.token
      request.body = self.params
      request.content_type = "application/json"

      response = Net::HTTP.start(url.host, url.port, use_ssl: use_ssl?) { |http| http.request(request) }

      return JSON.parse(response.body)["retirectUrl"]
    end

    private
    
    def use_ssl?
      RocketPaysRailsApi.production?
    end
  end
end
