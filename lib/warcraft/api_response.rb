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

    protected

    def link
      resource_name = caller_locations(1, 1)[0].label.to_sym
      @memoized_responses[resource_name] ||= @client.get(@response.dig(resource_name, :href))
    end
  end
end
