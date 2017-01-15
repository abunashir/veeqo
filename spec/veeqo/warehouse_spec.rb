require "spec_helper"

RSpec.describe Veeqo::Warehouse do
  describe ".list" do
    it "retrieves the list of warehouses" do
      filters = { page: 1, page_size: 12 }

      stub_veeqo_warehouse_list_api(filters)
      warehouses = Veeqo::Warehouse.list(filters)

      expect(warehouses.count).to eq(1)
      expect(warehouses.first.id).not_to be_nil
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

  describe ".delete" do
    it "deletes the specified warehouse" do
      warehouse_id = 123

      stub_veeqo_warehouse_delete_api(warehouse_id)
      warehouse_deletion = Veeqo::Warehouse.delete(warehouse_id)

      expect(warehouse_deletion.successful?).to be_truthy
    end
  end
end
