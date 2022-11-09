class User < ApplicationRecord
    has_many :recipes
    has_secure_password
    before_save {self.mail = mail.downcase}
    validates :nombre, presence: true, length: {minimum:3, maximum:30}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    validates :password, presence: true, length: {minimum: 6}
end
