require 'graphql'
require_relative './types/place'
# Dir['./types/*.rb'].each { |f| require_relative f }

class QueryType < GraphQL::Schema::Object
  description 'The query root of this schema'

  field :places, [Types::Place], null: false do
    description 'Get all places'
  end

  def places
    Place.all
  end
end