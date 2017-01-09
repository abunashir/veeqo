module Veeqo
  class Product < Base
    include Veeqo::Actions::List
    include Veeqo::Actions::Find

    def create(title:, variants:, images: [], **attributes)
      required_attributes = {
        title: title,
        product_variants_attributes: variants,
        images_attributes: images,
      }

      create_resource(product: required_attributes.merge(attributes))
    end

    def update(product_id, attributes)
      update_resource(product_id, product: attributes)
    end

    def delete(product_id)
      delete_resource(product_id)
    end

    private

    def end_point
      "products"
    end
  end
end
