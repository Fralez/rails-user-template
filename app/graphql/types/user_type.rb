module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :binary_gender, Integer, null: false
    field :date_of_birth, GraphQL::Types::ISO8601DateTime, null: false
  end
end
