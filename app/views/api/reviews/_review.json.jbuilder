json.extract! review, :reviewer_id, :product_id, :comment, :rating, :created_at
json.reviewer review.reviewer.first_name