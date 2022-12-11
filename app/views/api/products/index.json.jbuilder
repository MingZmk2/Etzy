@products.each do |product|
  json.set! product.id do 
      json.extract! product, :id, :description, :name, :price, :seller_id
     
      json.seller do 
          json.partial! "api/users/user", user: product.seller
      end

      json.reviews do
        @product.reviews.each do |review|
            json.set! review.id do 
                json.extract! review, :id, :product_id, :reviewer_id, :comment, :rating, :created_at
                json.reviewer review.reviewer.username
            end
        end
    end
  end
end