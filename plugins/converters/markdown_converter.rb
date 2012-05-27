class Ruhoh
  module ConverterOff
    module Markdown

      def self.extensions
        ['.amd', '.markdown']
      end
      
      def self.convert(page)
        require 'kramdown'
        Kramdown::Document.new(page.content).to_html
      end
    end
  end
end

class Ruhoh
  module Converter
    module MarkdownMeep
      
      def self.extensions
        ['.meep', '.markdown_meep']
      end
      
      def self.convert(page)
        page.content.upcase
      end
      
    end #Markdown
  end #Converter
end #Ruhoh