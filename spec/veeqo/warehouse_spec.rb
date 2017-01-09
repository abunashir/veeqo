require "spec_helper"

RSpec.describe Veeqo::Warehouse do
  describe ".list" do
    context "without any filters" do
      it "retrieves the list of warehouses" do
        stub_veeqo_warehouse_list_api
        warehouses = Veeqo::Warehouse.list

        expect(warehouses.count).to eq(1)
        expect(warehouses.first.id).not_to be_nil
      end
    end

    context "with custom filters" do
      it "retrieves the list based on the filters" do
        filters = { page: 1, page_size: 12 }

        stub_veeqo_warehouse_list_api(filters)
        warehouses = Veeqo::Warehouse.list(filters)

        expect(warehouses.count).to eq(1)
        expect(warehouses.first.id).not_to be_nil
      end
    end
  end
end
