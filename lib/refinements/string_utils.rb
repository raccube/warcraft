module StringUtils
  refine String do
    def slugify = self.downcase.gsub(' ', '-')
  end
end