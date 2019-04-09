require 'sinatra/base'
require './lib/user'

class PinkBnB < Sinatra::Base
  get '/' do
    "Hello world"
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

  run! if app_file == $0
end
