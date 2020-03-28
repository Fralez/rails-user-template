module Mutations
  class DeleteUser < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: true

    def resolve(id:)
      # check_authentication!
      success = false
      ActiveRecord::Base.transaction do
        User.find(id).destroy!
        success = true
      end

      { success: success }
    end
  end
end