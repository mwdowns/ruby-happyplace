require 'graphql'
require_relative './base_object'

class Types::User < Types::BaseObject
  description 'a user'

  field :id, ID, null: false
  field :first_name, String, null: false
  field :last_name, String, null: false
  field :email, String, null: false
end