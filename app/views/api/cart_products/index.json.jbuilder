json.carts do
  @carts.each do |cart|
    json.set! cart.id do
      json.partial! "api/cart_products/cart_product", cart: cart
      json.product cart.product.product_name
      json.price cart.product.price
      json.img @cart.product.photo.url
      # check if need availability data---
      # json.stock cart.product.availability
    end
  end
end

#refactor code later to see if seller name appears on top of each product in cart index page

if @current_user
  json.products do
    @current_user.buyer_items.each do |product|
      json.set! product.id do 
        json.partial! 'api/products/product', product: product
        if product.photo.attached?
          json.img product.photo.url
        end
      end
    end
  end
end