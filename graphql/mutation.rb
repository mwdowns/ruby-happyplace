require 'graphql'
require_relative './mutations/create_place'
require_relative './mutations/create_user'
require_relative './mutations/create_happy_place'

class MutationType < GraphQL::Schema::Object
  description 'The mutation root of this schema'

  field :createPlace, mutation: Mutations::CreatePlace
  field :createUser, mutation: Mutations::CreateUser
  field :createHappyPlace, mutation: Mutations::CreateHappyPlace
end