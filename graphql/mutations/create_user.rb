require 'graphql'
require_relative 'base_mutation'

class Mutations::CreateUser < Mutations::BaseMutation
  description 'create a new user object'

  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true
  argument :password_confirmation, String, required: true

  field :success, Boolean, null: false
  field :user, Types::User, null: true
  field :errors, String, null: false

  def resolve(
    first_name:,
    last_name:,
    email:,
    password:,
    password_confirmation:
  )
    user = User.new(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
      password_confirmation: password_confirmation
    )

    if user.save
      {
        success: true,
        user: user,
        errors: []
      }
    else
      {
        success: false,
        user: nil,
        errors: user.errors.full_message
      }
    end
  end
end
