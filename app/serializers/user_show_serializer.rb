class UserShowSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :show_id

    belongs_to :user
    belongs_to :show
end