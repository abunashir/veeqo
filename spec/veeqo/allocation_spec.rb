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
