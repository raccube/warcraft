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
        Time.at(last_login_timestamp)
      end

      # @return [String]
      def url
        @response.dig(:_links, :self, :href)
      end
    end
  end
end
