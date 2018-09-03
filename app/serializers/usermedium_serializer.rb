class UserMediumSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :medium_id

    belongs_to :user
    belongs_to :medium
end