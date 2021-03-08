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
      response = HTTParty.get(region.nil? ? url : "https://#{region}.api.blizzard.com#{url}",
                              headers: {
                                'Authorization': "Bearer #{token}"
                              }, format: :plain)
      JSON.parse(response.body, symbolize_names: true)
    end

    # @param [Symbol] region Region to fetch data for (optional)
    def userinfo(region: self.region, token: self.token)
      domain = region == :cn ? "www.battlenet.com.cn" : "#{region}.api.blizzard.com"
      response = HTTParty.get("https://#{domain}/oauth/userinfo?access_token",
                              headers: {
                                'Authorization': "Bearer #{token}"
                              }, format: :plain)
      JSON.parse(response.body, symbolize_names: true)
    end

    # @return [Warcraft::AccountRequest]
    def account(token: self.token, region: self.region)
      AccountRequest.new(self, region, token)
    end

    # @return [Warcraft::CharacterRequest]
    def character(realm:, character_name:, region: self.region)
      CharacterRequest.new(self, region, realm.slugify, character_name.slugify)
    end
  end
end
