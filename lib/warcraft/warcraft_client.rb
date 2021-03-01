module Warcraft
  class Client
    using StringUtils

    attr_accessor :token
    attr_accessor :region

    # @param [String] token Access Token
    # @param [Symbol] region Region to query for, e.g. <code>:eu</code>
    def initialize(token, region)
      self.token = token
      self.region = region
    end

    # @param [Symbol] region
    # @param [String] url
    # @return [Hash]
    def get(region, url)
      response = HTTParty.get("https://#{region}.api.blizzard.com#{url}",
                              headers: {
                                'Authorization': "Bearer #{self.token}"
                              }, format: :plain)
      JSON.parse(response.body, symbolize_names: true)
    end

    # @param [Symbol] region Region to fetch data for (optional)
    def userinfo(region = nil)
      domain = region == :cn ? "www.battlenet.com.cn" : "#{region}.api.blizzard.com"
      response = HTTParty.get("https://#{domain}/oauth/userinfo?access_token",
                              headers: {
                                'Authorization': "Bearer #{self.token}",
                              }, format: :plain)
      JSON.parse(response.body, symbolize_names: true)
    end

    def character(realm, character_name, region = nil)
      CharacterRequest.new(self, region ||= self.region, realm.slugify, character_name.slugify)
    end
  end
end