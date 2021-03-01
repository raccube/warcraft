module Warcraft
  class ApiRequest
    def get(url)
      @client.get(@region, "#{url}?namespace=#{namespace}")
    end

    def namespace
      "profile-#{@region}"
    end
  end
end