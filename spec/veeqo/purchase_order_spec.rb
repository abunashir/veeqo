require "spec_helper"

RSpec.describe Veeqo::PurchaseOrder do
  describe ".list" do
    it "retrieves the list of purchase orders" do
      filter_hash = { page: 2, page_size: 10 }
      stub_veeqo_purchase_order_list_api(filter_hash)
      purchase_orders = Veeqo::PurchaseOrder.list(filter_hash)

      expect(purchase_orders.count).to eq(1)
      expect(purchase_orders.first.id).not_to be_nil
    end
  end
end
