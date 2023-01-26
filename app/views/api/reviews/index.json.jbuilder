@reviews.each do |review|
  json.set! review.id do
      json.extract! review, :comment, :rating, :reviewer_id, :product_id
      json.reviewer review.reviewer.first_name
  end
end