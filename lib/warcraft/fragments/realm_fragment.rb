# frozen_string_literal: true

module Warcraft
  module Fragments
    class RealmFragment
      def initialize(client, data)
        @client = client
        @data = data
      end
    end
  end
end
