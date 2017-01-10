require "spec_helper"

RSpec.describe Veeqo::DeliveryMethod do
  describe ".list" do
    it "retrieves all the develiery methods" do
      filters = { page: 1, page_size: 12 }

      stub_veeqo_delivery_method_list_api(filters)
      delivery_methods = Veeqo::DeliveryMethod.list(filters)

      expect(delivery_methods.count).to eq(1)
      expect(delivery_methods.first.id).not_to be_nil
    end
  end

  describe ".find" do
    it "retrieves the details for a delivery method" do
      delivery_method_id = 123

      stub_veeqo_delivery_method_find_api(delivery_method_id)
      delivery_method = Veeqo::DeliveryMethod.find(delivery_method_id)

      expect(delivery_method.name).not_to be_nil
    end
  end

  describe ".create" do
    it "creates a new deliver method" do
      attributes = { name: "Next Day Delivery" }

      stub_veeqo_delivery_method_create_api(attributes)
      delivery_method = Veeqo::DeliveryMethod.create(attributes)

      expect(delivery_method.id).not_to be_nil
      expect(delivery_method.name).to eq(attributes[:name])
    end
  end
end
