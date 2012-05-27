class Ruhoh
  module Templaters
    module Helpers
      LimitRegex = /^(\w+)_limit_(\d+)/

      def limit_to(method, limit)
        return false unless self.respond_to?(method.to_sym)
        self.__send__(method)[0, limit.to_i]
      end
      
      def method_missing(name, *args, &block)
        if name.to_s =~ LimitRegex
          self.limit_to($1, $2) || super
        else
          super
        end
      end

      def respond_to?(method)
        if method.to_s =~ LimitRegex
          true
        else
          super
        end
      end
        
    end
  end
end

class Ruhoh
  module Templaters
    module Helpers
      def mai
        "haro mai MEEP MEEP"
      end
      
      def teehee
        "TEE HEE: #{self.mai}"
      end
      
    end
  end
end