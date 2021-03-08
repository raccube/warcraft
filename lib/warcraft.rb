# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

module Warcraft
  class Error < StandardError; end

  class InvalidTokenError < Error; end

  class UnauthorizedError < Error; end

  class ResourceNotFoundError < Error; end
end
