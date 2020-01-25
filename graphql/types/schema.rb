require 'graphql'
require_relative 'query'
require_relative 'mutation'

class HappyPlaceAppSchema < GraphQL::Schema
  query QueryType
  mutation MutationType
end