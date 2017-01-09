module Veeqo
  class Customer < Base
    def list(filters = {})
      list_resource(filters)
    end

    def create(email:, **attributes)
      required_attributes = { email: email }
      create_resource(customer: required_attributes.merge(attributes))
    end

    private

    def end_point
      "customers"
    end
  end
end
