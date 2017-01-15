require "spec_helper"

RSpec.describe Veeqo::Order do
  describe ".list" do
    it "retrives the all of the orders" do
      filters = { page: "2", page_size: "25" }

      stub_veeqo_order_list_api(filters)
      orders = Veeqo::Order.list(filters)

      expect(orders.count).to eq(1)
      expect(orders.first.id).to eq(123)
    end
  end

  describe ".find" do
    it "retrieves a specific order" do
      order_id = 123
      stub_veeqo_order_find_api(order_id)
      order = Veeqo::Order.find(order_id)

      expect(order.number).not_to be_nil
    end
  end

  describe ".create" do
    it "creates a new order" do
      stub_veeqo_order_create_api(order_attributes)
      order = Veeqo::Order.create(order_attributes)

      expect(order.id).not_to be_nil
      expect(order.deliver_to.first_name).to eq("Sky")
      expect(order.payment.payment_type).not_to be_nil
    end
  end

  describe ".update" do
    it "updates the order with new attributes" do
      order_id = 123
      new_attributes = { number: "Inv #123" }

      stub_veeqo_order_update_api(order_id, new_attributes)
      order_update = Veeqo::Order.update(order_id, new_attributes)

      expect(order_update.successful?).to be_truthy
    end
  end

  describe ".delete" do
    it "deletes a specific order" do
      order_id = 123
      stub_veeqo_order_delete_api(order_id)
      order_delete = Veeqo::Order.delete(order_id)

      expect(order_delete.successful?).to be_truthy
    end
  end

  def order_attributes
    {
      channel_id: "3525",
      customer_id: "516208",
      delivery_method_id: "92298",
      deliver_to_attributes: {
        address1: "294 queenstown road",
        city: "london",
        country: "GB",
        customer_id: "516208",
        first_name: "Sky",
        last_name: "Schonhuber",
        phone: "07734450718",
        state: "london",
        zip: "sw8 4lt",
      },
      deliver_to_id: "1086864",
      line_items_attributes: [
        {
          price_per_unit: "13.99",
          quantity: "1",
          sellable_id: "1226615",
          tax_rate: "0",
        },
      ],
      payment_attributes: {
        payment_type: "bank_transfer",
        reference_number: "123456789",
      },
      send_notification_email: "false",
      total_discounts: "0",
      total_tax: "0",
    }
  end
end
