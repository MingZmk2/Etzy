# == Schema Information
#
# Table name: cart_products
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  buyer_id   :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_cart_products_on_buyer_id    (buyer_id)
#  index_cart_products_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (buyer_id => users.id)
#  fk_rails_...  (product_id => products.id)
#
class CartProduct < ActiveRecord::Base
  validates :buyer_id, :product_id, :quantity, presence: true
    
  belongs_to :buyer,
    foreign_key: :buyer_id,
    class_name: :User

  belongs_to :product,
    foreign_key: :product_id,
    class_name: :Product

  def self.find_by_user_and_product(user_id, product_id)
      cart_item = CartProduct.find_by(buyer_id: user_id, product_id: product_id)
      return cart_item
  end

end
