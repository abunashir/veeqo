module Veeqo
  class Product < Base
    def list(filters = {})
      Veeqo.get_resource("products", filters)
    end

    def find(product_id)
      Veeqo.get_resource(
        ["products", product_id].join("/"),
      )
    end

    def create(title:, variants:, images: [], **attributes)
      required_attributes = {
        title: title,
        product_variants_attributes: variants,
        images_attributes: images,
      }

      Veeqo.post_resource(
        "products", product: required_attributes.merge(attributes)
      )
    end

    def update(product_id, attributes)
      Veeqo.put_resource(
        ["products", product_id].join("/"), product: attributes
      )
    end

    def delete(product_id)
      Veeqo.delete_resource("products", product_id)
    end
  end
end
