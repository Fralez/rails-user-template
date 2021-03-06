# frozen_string_literal: true

module Resolvers
  class Users < Resolvers::Base
    type [Types::UserType], null: true

    def resolve
      check_authentication!
      ::User.all
    end
  end
end
