require 'sinatra'
require 'dotenv'
require 'json'
require 'rack/contrib'

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
    Json.generate(result)
  end
end