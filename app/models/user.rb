class User < ApplicationRecord
    has_many :user_shows
    has_many :shows, through: :user_shows

    validates_presence_of :username, :password_digest
    validates :username, uniqueness: true

    has_secure_password
end
