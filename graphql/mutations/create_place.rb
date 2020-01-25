require 'graphql'
require_relative 'base_mutation'

class Mutations::CreatePlace < Mutations::BaseMutation
  description 'create a new place object'

  argument :lat, String, required: true
  argument :lon, String, required: true

  field :success, Boolean, null: false
  field :place, [Types::Place], null: true
  field :errors, String, null: false

  def resolve(lat:, lon:)
    place = Place.new(
      lat: lat,
      lon: lon
    )

    if place.save
      {
        success: true,
        place: place,
        errors: []
      }
    else
      {
        success: false,
        place: nil,
        errors: place.errors.full_message
      }
    end
  end
end
