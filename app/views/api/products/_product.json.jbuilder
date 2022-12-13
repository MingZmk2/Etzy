json.extract! product, :id, :product_name, :seller_id, :price, :description, :availability

json.photo_url url_for(product.photo)