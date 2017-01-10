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
end
