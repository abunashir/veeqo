require "spec_helper"

RSpec.describe Veeqo::Product do
  describe ".list" do
    it "retrieve the lists of products" do
      product_filters = { page_size: 10 }

      stub_veeqo_product_list_api(product_filters)
      products = Veeqo::Product.list(product_filters)

      expect(products.count).to eq(1)
      expect(products.first.id).not_to be_nil
    end
  end

  describe ".find" do
    it "retrieves the specific product" do
      product_id = 123

      stub_veeqo_product_find_api(product_id)
      product = Veeqo::Product.find(product_id)

      expect(product.id).to eq(product_id)
      expect(product.title).not_to be_nil
    end
  end

  describe ".create" do
    it "creates a new product" do
      stub_veeqo_product_create_api(product_attributes)
      product = Veeqo::Product.create(product_attributes)

      expect(product.id).not_to be_nil
      expect(product.title).to eq("T-Shirt")
    end
  end

  describe ".update" do
    it "updates the product with new attributes" do
      product_id = 123
      new_attributes = { title: "Best T Shirt" }

      stub_veeqo_product_update_api(product_id, new_attributes)
      product_update = Veeqo::Product.update(product_id, new_attributes)

      expect(product_update.successful?).to be_truthy
    end
  end

  describe ".delete" do
    it "deletes the specific product" do
      product_id = 123
      stub_veeqo_product_delete_api(product_id)
      product_delete = Veeqo::Product.delete(product_id)

      expect(product_delete.successful?).to be_truthy
    end
  end

  def product_attributes
    {
      title: "T Shirt",
      variants: [
        {
          cost_price: "10",
          min_reorder_level: "0",
          price: "15",
          quantity_to_reorder: "0",
          sku_code: "t-shirt-large",
          tax_rate: "0",
          title: "Large",
        },
      ],
      images: [
        {
          display_position: "1",
          src: "http://veeqo.com/t-shirt.jpg",
        },
      ],
    }
  end
end
