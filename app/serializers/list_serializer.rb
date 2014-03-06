class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :archived, :board_id, :created_at, :updated_at
end
