require 'graphql'
require_relative './base_object'

class Types::Place < Types::BaseObject
  description 'a place with latitude and longitude'

  field :id, ID, null: false
  field :lat, String, null: false
  field :lon, String, null: false
end