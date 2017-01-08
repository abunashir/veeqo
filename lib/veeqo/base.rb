module Veeqo
  class Base
    def self.method_missing(method_name, *arguments, &block)
      if new.respond_to?(method_name, include_private: false)
        new.send(method_name, *arguments, &block)
      else
        super
      end
    end

    private

    def list_resource(filters)
      Veeqo.get_resource(end_point, filters)
    end

    def create_resource(attributes)
      Veeqo.post_resource(end_point, attributes)
    end
  end
end
