# frozen_string_literal: true

module Types
  # GraphQL/Types/BaseObject
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField
  end
end
