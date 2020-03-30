# frozen_string_literal: true

module Resolvers
  class Base < GraphQL::Schema::Resolver
    def check_authentication!
      return if context[:current_user]

      raise GraphQL::ExecutionError,
            'You need to authenticate to perform this action'
    end
  end
end
