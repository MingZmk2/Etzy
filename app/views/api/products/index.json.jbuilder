@products.each do |product|
  json.set! product.id do 
    json.partial! 'api/products/product', product: product
    # json.img product.photo.url
    # json.photo_url url_for(product.photo)

    # json.seller do 
    #   json.partial! "api/users/user", user: product.seller
    # end
    
    json.reviews do
      product.reviews.each do |review|
        json.set! review.id do 
          json.partial! 'api/reviews/review', review: review
        end
      end
    end
  end
end

# @products.each do |product|
#     json.set! product.id do
#         json.extract! product, :id, :product_name, :seller_id, :price, 
#         :category_id, :availability, :description, :store_id
#         json.store_name product.store.store_name
#         json.store_sales product.store.sales
#         json.img product.photo.url
#         json.category product.category.name
#         json.reviews do
#             product.reviews.each do |review|
#                 json.set! review.id do 
#                     json.extract! review, :id, :product_id, :reviewer_id, :content, :rating, :created_at
#                     json.reviewer review.reviewer.username
#                 end
#             end
#         end
        
#     end
# end