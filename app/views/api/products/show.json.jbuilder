json.partial! 'api/products/product', product: @product

json.img @product.photo.url
#^^if error try---
# json.photoUrl url_for(@product.photo)

json.reviews do
  @reviews.each do |review|
    json.set! review.id do
      json.partial! 'api/reviews/review', review: review
    end
  end
end

#bonus feature category
# json.category do
#     json.extract! @product.category, :id, :name, :label
# end
    
##alternative
# json.category @product.category.name
