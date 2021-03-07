# frozen_string_literal: true

module Warcraft
  module Character
    class Achievements < ApiResponse
      def total_quantity
        @response[:total_quantity]
      end

      def total_points
        @response[:total_points]
      end

      # @return [Array<AchievementFragment>]
      def achievements
        @achievements ||= @response[:achievements].map { |a| AchievementFragment.new(@client, a) }
      end

      # @return [Array<CategoryProgress>]
      def category_progress
        @category_progress ||= @response[:category_progress].map { |c| CategoryProgress.new(@client, c) }
      end

      # @return [Array<AchievementEvent>]
      def recent_events
        @recent_events ||= @response[:recent_events].map { |e| AchievementEvent.new(@client, e) }
      end

      # @return [Warcraft::Fragments::CharacterFragment]
      def character
        @character ||= CharacterFragment.new(@client, @response[:character])
      end

      def statistics
        link
      end
    end

    class AchievementFragment
      def initialize(client, data)
        @client = client
        @data = data
      end

      # @return [Integer]
      def id
        @data[:id]
      end

      # @return [String]
      def name
        @data.dig(:achievement, :name)
      end

      # @return [String]
      def url
        @data.dig(:achievement, :key, :href)
      end

      def full_achievement
        @client.get(url)
      end

      # @return [Hash]
      def criteria
        @data[:criteria]
      end

      # @return [Boolean]
      def child_criteria?
        @data[:criteria].key? :child_criteria
      end

      # @return [Array<Hash>]
      def child_criteria
        has_child_criteria? ? @data.dig(:criteria, :child_criteria) : []
      end

      # @return [Integer]
      def criteria_id
        @data.dig(:criteria, :id)
      end

      # @return [Boolean]
      def completed?
        @data.dig(:criteria, :is_completed)
      end

      # @return [Time]
      def completed_at
        ApiResponse.convert_time(@data[:completed_timestamp])
      end
    end

    class CategoryProgress
      def initialize(client, data)
        @client = client
        @data = data
      end

      # @return [Integer]
      def quantity
        @data[:quantity]
      end

      # @return [Integer]
      def points
        @data[:points]
      end

      # @return [Hash]
      def name
        @data.dig(:category, :name)
      end

      # @return [Hash]
      def category
        @data[:category]
      end

      def full_category
        @client.get(category_url)
      end

      # @return [Integer]
      def category_id
        @data.dig(:category, :id)
      end

      # @return [String]
      def category_url
        @data.dig(:category, :key, :href)
      end
    end

    class AchievementEvent
      def initialize(client, data)
        @client = client
        @data = data
      end

      # @return [String]
      def achievement_url
        @data.dig(:achievement, :key, :href)
      end

      # @return [String]
      def achievement_name
        @data.dig(:achievement, :name)
      end

      # @return [Integer]
      def achievement_id
        @data.dig(:achievement, :id)
      end

      # @return [Time]
      def time
        ApiResponse.convert_time(@data[:timestamp])
      end
    end
  end
end
