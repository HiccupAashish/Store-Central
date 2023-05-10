class User < ApplicationRecord
    has_many :carts,:dependent => :destroy
    has_one_attached :image
    has_secure_password

    before_save { self.email = email.downcase }

    validates :name, presence: true
    

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },uniqueness: true

    validates :password, presence: true, length: { minimum: 3 }

    has_many :products ,:dependent => :destroy 
    has_many :categories,:dependent => :destroy
    has_many :histories,:dependent => :destroy
    has_many :posts,:dependent => :destroy
    has_many :comments,:dependent => :destroy
end
