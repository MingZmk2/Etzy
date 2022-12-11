# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  description  :text             not null
#  price        :decimal(10, 2)   not null
#  product_name :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :integer          not null
#  seller_id    :integer          not null
#
# Indexes
#
#  index_products_on_category_id   (category_id)
#  index_products_on_product_name  (product_name)
#  index_products_on_seller_id     (seller_id)
#
class Product < ActiveRecord::Base
  validates :product_name, :seller_id, :price, :description, :price, presence: true
  #possibly add category_id validation for bonus feature

  belongs_to :seller,
    foreign_key: :seller_id,
    class_name: :User

  has_many :in_cart,
    foreign_key: :product_id,
    class_name: :CartProduct,
    dependent: :destroy 

  has_many :reviews,
    foreign_key: :product_id,
    class_name: :Review,
    dependent: :destroy 

  has_one_attached :photo
  #use has_many for more photos
  # has_many_attached :photo

  #for bonus feature later
  # belongs_to :category,
  # foreign_key: :category_id,
  # class_name: :Category

end
