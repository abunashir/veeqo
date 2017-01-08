module Veeqo
  class Product
    def self.list(filters = {})
      Veeqo.get_resource("products", filters)
    end

    def self.create(title:, variants:, images: [], **attributes)
      required_attributes = {
        title: title,
        product_variants_attributes: variants,
        images_attributes: images,
      }

      Veeqo.post_resource(
        "products", product: required_attributes.merge(attributes)
      )
    end
  end
end
