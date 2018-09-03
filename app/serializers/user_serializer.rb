class UserSerializer < ActiveModel::Serializer
    attributes :id, :username

    has_many :user_media
    has_many :media, through: :user_media
end