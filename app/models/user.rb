class User < ApplicationRecord
    has_secure_password
    before_validation :ensure_session_token
    validates :email, uniqueness: true, 
    length: {in: 5..255},
    format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence: true
    validates :session_token, uniqueness: true
    validates :password, length: {in: 6..255}, allow_nil: true

    def self.find_by_credentials(credential, password)
        if URI::MailTo::EMAIL_REGEXP.match(credential)
            user = User.find_by(email: credential)
        else
            
            user = User.find_by(first_name: credential)
        end
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