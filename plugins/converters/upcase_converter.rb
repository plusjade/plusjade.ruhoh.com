class Ruhoh
  module Converter
    module Textile
      
      def self.extensions
        '.up'
      end
      
      def self.convert(content)
        content.upcase
      end
    end #Textile
  end #Converter
end #Ruhoh