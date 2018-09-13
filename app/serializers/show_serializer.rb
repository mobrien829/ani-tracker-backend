class ShowSerializer < ActiveModel::Serializer
    attributes :id, :malId, :title, :description, :coverImgString, :genres, :bannerImgString

    has_many :user_show
    has_many :users, through: :user_show
end