# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    before_action :set_paper_trail_whodunnit
    def user_for_paper_trail
      context[:current_user].try(:id)
    end

    def check_authentication!
      return if context[:current_user]

      raise GraphQL::ExecutionError,
            'You need to authenticate to perform this action'
    end
  end
end
