# frozen_string_literal: true

module Warcraft
  class ApiRequest
    def initialize(client)
      super
      @client = client
    end

    def get(url)
      @client.get(@region, "#{url}?namespace=#{namespace}")
    end

    def namespace
      "profile-#{@region}"
    end
  end
end
