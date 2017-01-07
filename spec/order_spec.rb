require "spec_helper"

RSpec.describe Veeqo::Order do
  describe ".list" do
    context "without any filters" do
      it "retrives the list of orders" do
        stub_veeqo_order_list_api
        orders = Veeqo::Order.list

        expect(orders.count).to eq(1)
        expect(orders.first.id).to eq(123)
      end
    end

    context "with some custom filters" do
      it "retrives the list based on the filter" do
        filters = { page: "2", page_size: "25" }

        stub_veeqo_order_list_api(filters)
        orders = Veeqo::Order.list(filters)

        expect(orders.count).to eq(1)
        expect(orders.first.id).to eq(123)
      end
    end
  end
end
