# frozen_string_literal: true

require_relative "lib/warcraft/version"

Gem::Specification.new do |spec|
  spec.name          = "warcraft"
  spec.version       = Warcraft::VERSION
  spec.authors       = ["Karina Kwiatek"]
  spec.email         = ["racc@raccube.net"]

  spec.summary       = "A wrapper for the World of Warcraft Profile and Game Data APIs"
  spec.homepage      = "https://github.com/raccube/warcraft"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/raccube/warcraft"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.18"
  spec.add_dependency "zeitwerk", "~> 2.4"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
