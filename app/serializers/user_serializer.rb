class UserSerializer < ActiveModel::Serializer
    attributes :id, :username

    has_many :user_shows
    has_many :shows, through: :user_shows
end