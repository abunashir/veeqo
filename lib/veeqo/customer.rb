module Veeqo
  class Customer < Base
    include Veeqo::Actions::List
    include Veeqo::Actions::Find
    include Veeqo::Actions::Delete

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
