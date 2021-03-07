# frozen_string_literal: true

module Warcraft
  class CharacterRequest < ApiRequest
    # @param [Warcraft::Client] client
    def initialize(client, region, realm, character_name)
      super(client, region)
      @realm = realm
      @name = character_name
    end

    def profile
      Character::Profile.new(@client, get("/profile/wow/character/#{@realm}/#{@name}", region: @region))
    end

    def achievements
      Character::Achievements.new(@client, get("/profile/wow/character/#{@realm}/#{@name}/achievements",
                                               region: @region))
    end
  end
end
