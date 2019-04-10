require_relative './database_connection_setup'
require 'sinatra/base'
require 'sinatra/flash'

require './lib/user'
require './lib/space'

class PinkBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/space'
    else
      flash[:notice] = "Please check your username and password"
    end
  end

  post '/users/new' do
    user = User.create(name: params[:name], username: params[:username],
      email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/space'
  end

  get '/space' do
    @user = User.find(id: session[:user_id])
    @spaces = Space.all
    erb :space
  end

  post '/space' do
    Space.create(name: params[:name], description: params[:description], price: params[:price_per_night])
    redirect '/space'
  end

  run! if app_file == $0
end
