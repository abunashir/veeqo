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

  describe ".find" do
    it "retrieves the specific warehouse details" do
      warehouse_id = 123

      stub_veeqo_warehouse_find_api(warehouse_id)
      warehouse = Veeqo::Warehouse.find(warehouse_id)

      expect(warehouse.name).not_to be_nil
    end
  end

  describe ".create" do
    it "creates a new warehouse" do
      warehouse_attributes = { name: "My Warehouse" }

      stub_veeqo_warehouse_create_api(warehouse_attributes)
      warehouse = Veeqo::Warehouse.create(warehouse_attributes)

      expect(warehouse.id).not_to be_nil
      expect(warehouse.name).to eq(warehouse_attributes[:name])
    end
  end

  describe ".update" do
    it "updates a warehouse with new attributes" do
      warehouse_id = 123
      new_attributes = { name: "My Warehouse" }

      stub_veeqo_warehouse_update_api(warehouse_id, new_attributes)
      warehouse_update = Veeqo::Warehouse.update(warehouse_id, new_attributes)

      expect(warehouse_update.successful?).to be_truthy
    end
  end
end
