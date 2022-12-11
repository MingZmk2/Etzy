json.extract! @product, :id, :name, :price, :description
json.seller do
    json.partial! "api/users/user", user: @product.seller
end
#bonus feature category
json.category do
    json.extract! @product.category, :id, :name, :label
end
    