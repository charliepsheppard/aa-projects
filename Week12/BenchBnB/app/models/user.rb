class User < ApplicationRecord
    validates :username, presence: true
    attr_reader :password 
    after_initialize :esure_session_token

    def self.find_by_credentals(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil 
    end

    def password=(password)
        @passwor = password
        self.password_digest = BCrypt::Password.creat(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def esure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end
