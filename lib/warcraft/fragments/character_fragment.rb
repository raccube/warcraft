# frozen_string_literal: true

require_relative "realm_fragment"

module Warcraft
  module Fragments
    class CharacterFragment
      def initialize(client, data)
        @client = client
        @data = data
      end

      # @return [String]
      def url
        @data.dig(:key, :href)
      end

      def id
        @data[:id]
      end

      def slug
        @data[:slug]
      end

      def realm
        @realm ||= RealmFragment.new(@client, @data[:realm])
      end
    end
  end
end
