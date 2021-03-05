# frozen_string_literal: true

module StringUtils
  refine String do
    def slugify
      downcase.gsub(" ", "-")
    end
  end
end
