json.extract! review, :id, :product_id, :reviewer_id, :comment, :rating, :created_at

json.reviewer review.reviewer.first_name