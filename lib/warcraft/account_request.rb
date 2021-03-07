# frozen_string_literal: true

module Warcraft
  class AccountRequest < ApiRequest
    # @param [Warcraft::Client] client
    def initialize(client, region, token)
      super(client, region)
      @token = token
    end

    def profile
      Account::Profile.new(@client, get("/profile/user/wow"))
    end

    def protected_character
      # TODO
    end

    def collections
      # TODO
    end

    def mounts
      # TODO
    end

    def pets
      # TODO
    end
  end
end
