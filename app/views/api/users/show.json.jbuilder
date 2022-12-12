json.partial! 'api/users/user', user: @user

json.carts do
  @user.cartproducts.each do |cart| #check if it's cart_products if error
    json.set! cart.id do
      json.partial! "api/cart_products/cart_product", cart: cart
      json.price cart.product.price
      json.product cart.product.product_name
      json.stock cart.product.availability
      json.img cart.product.photo.url
    end
  end
end
