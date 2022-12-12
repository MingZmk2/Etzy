json.carts do
  json.set! @cart.id do
      json.partial! "api/cart_products/cart_product", cart: @cart
      json.price @cart.product.price
      json.product @cart.product.product_name
      json.img @cart.product.photo.url
      json.stock @cart.product.availability

  end
end

json.products do
  @cart.buyer.buyer_items.each do |product|
      json.set! product.id do 
        json.partial! 'api/products/product', product: product
        if product.photo.attached?
          json.img product.photo.url
        end
      end
    end
end