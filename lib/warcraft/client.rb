# frozen_string_literal: true

require "httparty"

module Warcraft
  class Client
    using Refinements::StringUtils

    attr_accessor :token, :region

    # @param [String] token Access Token
    # @param [Symbol] region Region to query for, e.g. <code>:eu</code>
    def initialize(token, region)
      self.token = token
      self.region = region
    end

    # @param [String] url
    # @param [Symbol] region
    # @return [Hash]
    def get(url, region: self.region, token: self.token)
      token = self.token if token.nil?
      url = "https://#{region}.api.blizzard.com#{url}" unless region.nil?
      get_rest_resource(url, token)
    end

    # @param [Symbol] region Region to fetch data for (optional)
    def userinfo(region: self.region, token: self.token)
      domain = region == :cn ? "www.battlenet.com.cn" : "#{region}.api.blizzard.com"
      get_rest_resource("https://#{domain}/oauth/userinfo?access_token", token)
    end

    # @return [Warcraft::AccountRequest]
    def account(token: self.token, region: self.region)
      AccountRequest.new(self, region, token)
    end

    # @return [Warcraft::CharacterRequest]
    def character(realm:, character_name:, region: self.region)
      CharacterRequest.new(self, region, realm.slugify, character_name.slugify)
    end

    private

    def get_rest_resource(url, token, **headers)
      response = HTTParty.get(url, headers: {
                                'Authorization': "Bearer #{token}",
                                **headers
                              }, format: :plain)

      raise InvalidTokenError, "The provided token is invalid or has expired." if response.code == 401
      raise UnauthorizedError if response.code == 403
      raise ResourceNotFoundError if response.code == 404

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
