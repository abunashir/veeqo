require "spec_helper"

RSpec.describe Veeqo::PurchaseOrder do
  describe ".list" do
    context "with out any parameter" do
      it "retrieves the purchase orders" do
        stub_veeqo_purchase_order_list_api
        purchase_orders = Veeqo::PurchaseOrder.list

        expect(purchase_orders.count).to eq(1)
        expect(purchase_orders.first.id).not_to be_nil
      end
    end

    context "with additiona hash params" do
      it "retrieves more precise purchase orders" do
        filter_hash = { page: 2, page_size: 10 }
        stub_veeqo_purchase_order_list_api(filter_hash)
        purchase_orders = Veeqo::PurchaseOrder.list(filter_hash)

        expect(purchase_orders.count).to eq(1)
        expect(purchase_orders.first.id).not_to be_nil
      end
    end
  end
end
