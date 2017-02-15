require "veeqo/request"
require "veeqo/actions/base"

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
      Veeqo::Request.new(:post, end_point, attributes).run
    end

    def update_resource(resource_id, attributes)
      Veeqo::Request.new(
        :put, [end_point, resource_id].join("/"), attributes
      ).run
    end
  end
end
