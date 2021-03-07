# frozen_string_literal: true

module Warcraft
  class ApiRequest
    def initialize(client, region)
      @client = client
      @region = region
    end

    def get(url, region: nil, token: nil, namespace: "profile-#{region}")
      region ||= @region
      @client.get("#{url}?namespace=#{namespace}", region: region, token: token)
    end
  end
end
