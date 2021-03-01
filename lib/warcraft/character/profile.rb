module Warcraft
  module Character
    class Profile < ApiResponse
      def id
        @response.id
      end

      def name
        @response.name
      end

      def last_login
        Time.at(@response.last_login_timestamp)
      end
    end
  end
end