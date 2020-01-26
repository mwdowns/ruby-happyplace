require 'graphql'
require_relative './types/place'
require_relative './types/user'
require_relative './types/happy_place'

class QueryType < GraphQL::Schema::Object
  description 'The query root of this schema'

  field :users, [Types::User], null: false do
    description 'Get all users'
  end

  field :places, [Types::Place], null: false do
    description 'Get all places'
  end

  field :happy_places, [Types::HappyPlace], null: false do
    description 'Get all happy places'
  end

  def users
    User.all
  end

  def places
    Place.all
  end

  def happy_places
    HappyPlace.all
  end
end