require "spec_helper"

RSpec.describe Veeqo::Shipment do
  describe ".create" do
    it "creates a new shipment" do
      stub_veeqo_shipment_create_api(shipment_attributes)
      shipment = Veeqo::Shipment.create(shipment_attributes)

      expect(shipment.id).not_to be_nil
      expect(shipment.order_id).to eq(shipment_attributes[:order_id])
      expect(shipment.allocation_id).to eq(shipment_attributes[:allocation_id])
    end
  end

  describe ".delete" do
    it "deletes a spcified shipment" do
      shipment_id = 123

      stub_veeqo_shipment_delete_api(shipment_id)
      shipment_deletion = Veeqo::Shipment.delete(shipment_id)

      expect(shipment_deletion.successful?).to be_truthy
    end
  end

  def shipment_attributes
    {
      order_id: 1,
      allocation_id: 1,
      shipment: {
        carrier_id: 3,
        notify_customer: false,
        update_remote_order: false,
        tracking_number: "12345679ABC",
      },
    }
  end
end
