require 'sinatra'
require 'dotenv'
require 'json'
require 'rack/contrib'
require 'pry'

# load models
Dir['./models/*.rb'].each { |f| require_relative f }
# load graphql
require_relative './graphql/schema'

Dotenv.load('./.env')

class HappyPlaceApp < Sinatra::Base
  set :database_file, 'config/database.yml'
  use Rack::PostBodyContentTypeParser

  get '/' do
    'It works!'
  end

  post '/graphql' do 
    result = HappyPlaceAppSchema.execute(
      params[:query],
      variables: params[:variables],
      context: { current_user: nil }
    )
    JSON.generate(result.to_h)
  end
end