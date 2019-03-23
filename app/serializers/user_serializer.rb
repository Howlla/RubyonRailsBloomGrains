class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :is_verified, :created_at, :updated_at, :last_login
end
