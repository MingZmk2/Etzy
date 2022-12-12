@products.each do |product|
  json.set! product.id do 
    json.partial! 'api/products/product', product: product
    
    json.seller do 
      json.partial! "api/users/user", user: product.seller
    end
    
    json.reviews do
      @product.reviews.each do |review|
        json.set! review.id do 
          json.partial! 'api/reviews/review', review: review
        end
      end
    end
  end
end