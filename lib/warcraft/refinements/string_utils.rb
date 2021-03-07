# frozen_string_literal: true

module Warcraft
  module Refinements
    module StringUtils
      refine String do
        def slugify
          downcase.gsub(" ", "-")
        end
      end
    end
  end
end
