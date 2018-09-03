class MediumSerializer < ActiveModel::Serializer
    attributes :id, :title, :anilistId, :malId, :description, :imgString

    has_many :user_media
    has_many :users, through: :user_media
end