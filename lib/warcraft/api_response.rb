require 'ostruct'
require 'forwardable'

module Warcraft
  class ApiResponse
    extend Forwardable

    def_delegator :@response, :[], :method_missing

    # @param [Hash] response A parsed character profile document
    def initialize(response)
      @response = response
    end
  end
end