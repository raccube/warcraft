# frozen_string_literal: true

module Warcraft
  class AccountRequest < ApiRequest
    # @param [Warcraft::Client] client
    def initialize(client, region, token)
      super(client, region)
      @token = token
    end

    # Account Profile Summary
    # @return [Warcraft::Account::Profile]
    def profile
      Account::Profile.new(@client, get("/profile/user/wow"))
    end

    # Protected Character Profile Summary
    def protected_character(realm_id, character_id)
      # TODO
    end

    # Account Collections Index
    def collections
      # TODO
    end

    # Account Mounts Collection Summary
    def mounts
      # TODO
    end

    # Account Pets Collection Summary
    def pets
      # TODO
    end
  end
end
