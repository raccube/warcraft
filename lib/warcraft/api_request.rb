# frozen_string_literal: true

module Warcraft
  class ApiRequest
    def initialize(client)
      @client = client
    end

    def get(url)
      @client.get("#{url}?namespace=#{namespace}", @region)
    end

    def namespace
      "profile-#{@region}"
    end
  end
end
