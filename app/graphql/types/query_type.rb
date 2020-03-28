module Types
  class QueryType < Types::BaseObject
    field :users, resolver: Resolvers::Users,
    description: "Get users"

    field :user, resolver: Resolvers::User,
    description: "Get user"
  end
end
