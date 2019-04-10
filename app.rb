require_relative './database_connection_setup'
require 'sinatra/base'

require './lib/user'
require './lib/space'

class PinkBnB < Sinatra::Base

  get '/' do
    erb :homepage
  end

  get '/users' do
    @users = User.all
    erb :users
  end

  get '/users/new' do
    erb :new_user
  end

  post '/users/new' do
    User.create(name: params[:name], username: params[:username],
      email: params[:email], password: params[:password])
    redirect 'users'
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
