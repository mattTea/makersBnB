require 'sinatra/base'
require './lib/space'

class PinkBnB < Sinatra::Base

  get '/' do
    "Hello world"
  end

  get '/space' do
    @spaces = Space.all
    erb :space
  end

  post '/space' do
    Space.create(name: params[:name], description: params[:description], price: params[:price_per_night])
    redirect '/space'
  end

  run! if app_file == $0
end
