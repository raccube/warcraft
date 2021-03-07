# frozen_string_literal: true

module Warcraft
  module Fragments
    class AccountCharacterFragment < Fragment
      def character
        link
      end

      def protected_character
        link
      end

      def name
        @data[:name]
      end

      def id
        @data[:id]
      end

      def realm_url
        @data.dig(:realm, :key, :href)
      end

      def realm_name
        @data.dig(:realm, :name)
      end

      def realm_id
        @data.dig(:realm, :id)
      end

      def realm_slug
        @data.dig(:realm, :slug)
      end

      def playable_class_url
        @data.dig(:playable_class, :key, :href)
      end

      def playable_class_id
        @data.dig(:playable_class, :id)
      end

      def playable_race_url
        @data.dig(:playable_race, :key, :href)
      end

      def playable_race_id
        @data.dig(:playable_race, :id)
      end

      def gender
        @dig.dig(:gender, :type)
      end

      def faction
        @dig.dig(:faction, :type)
      end

      def level
        @dig[:level]
      end

      # TODO: class, race, gender and faction are localised
    end
  end
end
