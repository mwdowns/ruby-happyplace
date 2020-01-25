require 'sinatra/activerecord'
# class for Place
class Place < ActiveRecord::Base
  validates :lat, presence: true
  validates :lon, presence: true
end