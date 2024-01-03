module Plugins
  module HyphenizeFilter
    def hyphenize(input)
      return input.gsub(" ", "-")
    end
  end
end

Liquid::Template.register_filter(Plugins::HyphenizeFilter)
