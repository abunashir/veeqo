module Veeqo
  class Customer < Base
    def list(filters = {})
      list_resource(filters)
    end

    def find(customer_id)
      find_resource(customer_id)
    end

    def create(email:, **attributes)
      required_attributes = { email: email }
      create_resource(customer: required_attributes.merge(attributes))
    end

    def update(customer_id, email:, **attributes)
      required_attributes = { email: email }

      update_resource(
        customer_id, customer: required_attributes.merge(attributes)
      )
    end

    private

    def end_point
      "customers"
    end
  end
end
