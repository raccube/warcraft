module Warcraft
  class ApiResponse
    # @param [Hash] response A parsed character profile document
    def initialize(response)
      @response = response
    end
  end
end