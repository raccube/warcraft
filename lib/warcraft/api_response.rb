# frozen_string_literal: true

require "ostruct"
require "forwardable"

module Warcraft
  class ApiResponse
    extend Forwardable

    def_delegator :@response, :[], :method_missing

    # @param [Hash] response A parsed character profile document
    def initialize(response)
      @response = response
    end

    def client
      @response[:client]
    end

    protected

    def link
      client.get(@response.dig(caller_locations(1, 1)[0].label.to_sym, :href))
    end
  end
end
