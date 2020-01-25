require 'sinatra'
require 'dotenv'

# load models
Dir['./models/*.rb'].each { |f| require_relative f }

Dotenv.load('./.env')

class HappyPlaceApp < Sinatra::Base
  set :database_file, 'config/database.yml'

  get '/' do
    'It works!'
  end

  post '/graphql' do 
  end
end