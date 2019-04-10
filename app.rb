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

  post '/sessions' do
    user = User.authenticate(username: params[:loginusername], password: params[:loginpassword])
    if user
      session[:user_id] = user.id
      redirect '/space'
    else
      flash[:notice] = "Please check your username and password"
      redirect '/'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "See you next time"
    redirect '/'
  end

  post '/users/new' do
    user = User.create(name: params[:signupname], username: params[:signupusername],
      email: params[:signupemail], password: params[:signuppassword])
    session[:user_id] = user.id
    redirect '/space'
  end

  get '/space' do
    @user = User.find(id: session[:user_id])
    @spaces = Space.all
    erb :space
  end

  post '/space/new' do
    Space.create(name: params[:name], description: params[:description], price: params[:price_per_night], user_id: session[:user_id])
    redirect '/space'
  end

  get '/space/new' do
    erb :new_space
  end

  run! if app_file == $0
end
