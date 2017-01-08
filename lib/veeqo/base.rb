module Veeqo
  class Base
    def self.method_missing(method_name, *arguments, &block)
      if new.respond_to?(method_name, include_private: false)
        new.send(method_name, *arguments, &block)
      else
        super
      end
    end
  end
end
