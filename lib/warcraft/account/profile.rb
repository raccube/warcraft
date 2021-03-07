# frozen_string_literal: true

module Warcraft
  module Account
    # @!method id
    # @return [Integer] Blizzard Battle.net Account ID
    class Profile < ApiRequest
      def collections
        link
      end

      def wow_accounts
        @wow_accounts ||= WowAccount.new(@client, @response[:wow_accounts])
      end

      def all_characters
        @response[:wow_accounts].map(:characters).flatten.map do |c|
          Fragments::AccountCharacterFragment.new(@client, c)
        end
      end
    end

    class WowAccount
      def initialize(client, data)
        @client = client
        @data = data
      end

      # The WoW account ID
      # @return [Integer]
      def id
        @data[:id]
      end

      # @return [Array<Warcraft::Fragments::AccountCharacterFragment>]
      def characters
        @characters ||= @data[:characters].map { |c| Fragments::AccountCharacterFragment.new(@client, c) }
      end
    end
  end
end
