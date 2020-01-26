require 'graphql'
require_relative 'base_mutation'

class Mutations::CreateHappyPlace < Mutations::BaseMutation
  description 'create a new happy_place object'

  argument :user_id, ID, required: true
  argument :place_id, ID, required: true
  argument :message, String, required: false
  argument :media_url, String, required: false

  field :success, Boolean, null: false
  field :happy_place, Types::HappyPlace, null: true
  field :errors, String, null: false

  def resolve(user_id:, place_id:, message: nil, media_url: nil)
    happy_place = HappyPlace.new(
      user_id: user_id, 
      place_id: place_id, 
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
