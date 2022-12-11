# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  first_name      :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_session_token  (session_token) UNIQUE
#
class User < ApplicationRecord
    has_secure_password
    before_validation :ensure_session_token
    validates :password, length: {minimum: 6}, allow_nil: true
    validates :email, presence: true , uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :first_name, presence: true
    validates :session_token, uniqueness: true


    has_many :products,
    foreign_key: :seller_id,
    class_name: :Product,
    dependent: :destroy 

    has_many :reviews,
    foreign_key: :reviewer_id,
    class_name: :Review,
    dependent: :destroy 

    has_many :cart_products,
    foreign_key: :buyer_id,
    class_name: :CartProduct,
    dependent: :destroy 

    has_many :buyer_products,
    through: :cart_products,
    source: :product


    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        if user&.authenticate(password) 
            return user
        else
            nil 
        end
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end

    def reset_session_token!
        self.session_token = generate_unique_session_token
        save!
        session_token
    end

    private

    def generate_unique_session_token
        while true
            token = SecureRandom.urlsafe_base64
            return token unless User.exists?(session_token: token)
        end
    end
end
