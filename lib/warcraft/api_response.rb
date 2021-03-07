# frozen_string_literal: true

require "forwardable"

module Warcraft
  class ApiResponse
    extend Forwardable

    def_delegator :@response, :[], :method_missing

    # @param [Hash] response A parsed character profile document
    def initialize(client, response)
      @client = client
      @response = response
      @memoized_responses = {}
    end

    # @return [String]
    def url
      @response.dig(:_links, :self, :href)
    end

    # @return [Time]
    def self.convert_time(timestamp)
      Time.at(timestamp / 1000)
    end

    protected

    def link
      resource_name = caller_locations(1, 1)[0].label.to_sym
      @memoized_responses[resource_name] ||= @client.get(@response.dig(resource_name, :href), region: nil)
    end
  end
end
