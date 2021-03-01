module Warcraft
  class CharacterRequest < ApiRequest
    # @param [Warcraft::Client] client
    def initialize(client, region, realm, character_name)
      @client = client
      @region = region
      @realm = realm
      @name = character_name
    end

    def profile
      Character::Profile.new get("/profile/wow/character/#{@realm}/#{@name}")
    end
  end
end