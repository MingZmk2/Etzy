# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  comment     :text             not null
#  rating      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :bigint           not null
#  reviewer_id :bigint           not null
#
# Indexes
#
#  index_reviews_on_product_id   (product_id)
#  index_reviews_on_reviewer_id  (reviewer_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (reviewer_id => users.id)
#
class Review < ActiveRecord::Base
    validates :comment, :rating, :reviewer_id, :product_id,  presence: true

    belongs_to :product,
      foreign_key: :product_id,
      class_name: :Product

    belongs_to :reviewer,
      foreign_key: :reviewer_id,
      class_name: :User
end
