class MediumSerializer < ActiveModel::Serializer
    attributes :id, :malId, :title, :description, :coverImgString, :genres, :bannerImgString

    has_many :user_media
    has_many :users, through: :user_media
end