require 'graphql'
require_relative './mutations/create_place'

class MutationType < GraphQL::Schema::Object
  description 'The mutation root of this schema'

  field :createPlace, mutation: Mutations::CreatePlace
end