require "spec_helper"

RSpec.describe Veeqo::Allocation do
  describe ".create" do
    it "creates a new allocation" do
      stub_veeqo_allocation_create_api(allocation_attributes)
      allocation = Veeqo::Allocation.create(allocation_attributes)

      expect(allocation.id).not_to be_nil
      expect(allocation.line_items.first.sellable.id).to eq(1226615)
    end
  end

  describe ".update" do
    it "updates an existing allocation" do
      allocation_id = 123_456

      stub_veeqo_allocation_update_api(allocation_id, allocation_attributes)
      allocation_update = Veeqo::Allocation.update(
        allocation_id, allocation_attributes
      )

      expect(allocation_update.successful?).to be_truthy
    end
  end

  describe ".delete" do
    it "deletes the specified allocation" do
      order_id = 123_456
      allocation_id = 456_789

      stub_veeqo_allocation_delete_api(order_id, allocation_id)
      allocation_delete = Veeqo::Allocation.delete(order_id, allocation_id)

      expect(allocation_delete.successful?).to be_truthy
    end
  end

  def allocation_attributes
    {
      order_id: 447452,
      warehouse_id: 5,
      line_items: [{
        sellable_id: 1226615,
        quantity: 1,
      }],
    }
  end
end
