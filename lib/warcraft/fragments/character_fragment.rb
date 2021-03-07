# frozen_string_literal: true

module Warcraft
  module Fragments
    class CharacterFragment < Fragment
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
        # TODO: Localised resource
      end
    end
  end
end
