require "spec_helper"

RSpec.describe Veeqo::Product do
  describe ".list" do
    context "without any filters" do
      it "retrieve the lists of products" do
        stub_veeqo_product_list_api
        products = Veeqo::Product.list

        expect(products.count).to eq(1)
        expect(products.first.id).not_to be_nil
      end
    end

    context "with custom filters" do
      it "retrieve product list based on filters" do
        product_filters = { page_size: 10 }

        stub_veeqo_product_list_api(product_filters)
        products = Veeqo::Product.list(product_filters)

        expect(products.count).to eq(1)
        expect(products.first.id).not_to be_nil
      end
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
