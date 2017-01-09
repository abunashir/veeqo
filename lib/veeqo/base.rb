require "veeqo/actions/list"
require "veeqo/actions/find"
require "veeqo/actions/delete"

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

    def create_resource(attributes)
      Veeqo.post_resource(end_point, attributes)
    end

    def update_resource(resource_id, attributes)
      Veeqo.put_resource(
        [end_point, resource_id].join("/"), attributes
      )
    end
  end
end
