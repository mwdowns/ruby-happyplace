require 'sinatra'
require 'dotenv'

Dotenv.load('./.env')

class HappyPlaceApp < Sinatra::Base
  set :database_file, 'config/database.yml'

  get '/' do
    'It works!'
  end
end