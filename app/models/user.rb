class User < ApplicationRecord
    has_many :user_media
    has_many :media, through: :user_media

    validates_presence_of :username, :password_digest
    validates :username, uniqueness: true

    has_secure_password
end
