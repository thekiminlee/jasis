require 'sinatra'
require './config.rb'

get '/' do
  erb :index
end

get '/api/users' do
  content_type :json
  output({ :name => 'jojo' }, 402)
end

get '/about' do
  "wow"
end

get '/ga' do
  "ga"
end

get '/omg' do
  'omg'
end

get '/w' do
  "gas"
end