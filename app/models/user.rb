class User < ApplicationRecord
 

    include UsersHelper
    
    has_one_attached :image
    has_secure_password

    before_save { self.email = email.downcase }

    validates :name, presence: true
    

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },uniqueness: true

    validates :password, presence: true, length: { minimum: 3 }

    has_many :products  
    has_many :categories
    has_many :employees
    has_many :histories
end
