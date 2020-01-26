require 'graphql'
Dir['./types/*.rb'].each { |f| require_relative f }

class QueryType < GraphQL::Schema::Object
  description 'The query root of this schema'

  field :users, [Types::Users], null: false do
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