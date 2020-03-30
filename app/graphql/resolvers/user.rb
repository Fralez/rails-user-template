# frozen_string_literal: true

module Resolvers
  class User < Resolvers::Base
    type Types::UserType, null: true

    argument :id, ID, required: false

    def resolve(id:)
      check_authentication!
      user = ::User.find_by_id(id)

      return nil if user.nil?

      user
    end
  end
end
