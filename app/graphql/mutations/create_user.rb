# frozen_string_literal: true

module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :id, ID, required: false
    argument :name, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
    argument :binary_gender, Integer, required: false
    argument :date_of_birth, GraphQL::Types::ISO8601DateTime, required: false

    field :user, Types::UserType, null: true

    def resolve(**args)
      check_authentication!
      user = nil
      if args[:id].present?
        ActiveRecord::Base.transaction do
          user = User.find_by_id(args[:id])
          user.update!(**args.except(:id))
        end
      else
        ActiveRecord::Base.transaction do
          user = User.create!(**args.except(:id))
        end
      end
      { user: user }
    end
  end
end
