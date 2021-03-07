# frozen_string_literal: true

require_relative "../api_response"

module Warcraft
  module Character
    # @!method id
    #   @return [Integer]
    # @!method name
    #   @return [String]
    # @!method level
    #   @return [Integer]
    # @!method experience
    #   @return [Integer]
    # @!method achievement_points
    #   @return [Integer]
    # @!method last_login_timestamp
    #   @return [Integer]
    # @!method average_item_level
    #   @return [Integer]
    # @!method equipped_item_level
    #   @return [Integer]
    class Profile < ApiResponse
      def last_login
        ApiResponse.convert_time(last_login_timestamp)
      end

      def achievements
        link
      end

      def titles
        link
      end

      def pvp_summary
        link
      end

      def encounters
        link
      end

      def media
        link
      end

      def hunter_pets
        link
      end

      def specializations
        link
      end

      def statistics
        link
      end

      def mythic_keystone_profile
        link
      end

      def equipment
        link
      end

      def appearance
        link
      end

      def collections
        link
      end

      def reputations
        link
      end

      def quests
        link
      end

      def achievements_statistics
        link
      end

      def professions
        link
      end
    end
  end
end
