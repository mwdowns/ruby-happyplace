require 'sinatra/activerecord'
# class for HappyPlace
class HappyPlace < ActiveRecord::Base
  validates :user_id, presence: true
  validates :place_id, presence: true

  belongs_to :user
  belongs_to :place
end