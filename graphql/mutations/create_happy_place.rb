require 'graphql'
require_relative 'base_mutation'

class Mutations::CreateHappyPlace < Mutations::BaseMutation
  description 'create a new happy_place object'

  argument :user, Types::User, required: true
  argument :place, Types::Place, required: true
  argument :message, String, required: false,
  argument :media_url, String, required: false

  field :success, Boolean, null: false
  field :happy_place, Types::HappyPlace, null: true
  field :errors, String, null: false

  def resolve(user:, place:, message: nil, media_url: nil)
    happy_place = HappyPlace.new(
      user: user, 
      place: place, 
      message: message, 
      media_url: media_url
    )

    if happy_place.save
      {
        success: true,
        happy_place: happy_place,
        errors: []
      }
    else
      {
        success: false,
        happy_place: nil,
        errors: happy_place.errors.full_message
      }
    end
  end
end
