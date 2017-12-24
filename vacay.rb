require 'sinatra'
require 'dotenv/load'

use Rack::Auth::Basic, 'Restricted Area' do |username, password|
  username == ENV['USERNAME'] && password == ENV['PASS']
end

get '/' do
  erb :index
end

get '/hawaii' do
  @destination = params[:destination]
  if @destination != 'Hawaii'
    @message = "#{@destination}?? How about a nice trip to Hawaii instead? Yay!"
  else
    @message = "Congratulations! You're going to HAWAII, yay!"
  end
  erb :hawaii
end

get '/flight' do
  @certificate = ENV['CODE']
  @pin = ENV['PIN']
  erb :flight
end
