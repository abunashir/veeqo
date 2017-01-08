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
end
