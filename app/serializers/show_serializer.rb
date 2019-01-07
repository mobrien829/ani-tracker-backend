class ShowSerializer < ActiveModel::Serializer
    attributes :id, :malId, :title, :description, :coverImgString, :genres, :bannerImgString

    has_many :user_shows
    has_many :users, through: :user_shows
end