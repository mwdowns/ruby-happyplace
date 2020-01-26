require 'graphql'
require_relative './base_object'

class Types::User < Types::BaseObject
  description 'a user'

  field :id, ID, null: false
  field :user, Types::User, null: false
  field :place, Types::Place, null: false
  field :message, String, null: true
  field :media_url, String, null: true
end