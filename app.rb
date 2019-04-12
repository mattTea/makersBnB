require_relative './database_connection_setup'
require 'sinatra/base'
require 'sinatra/flash'

require './lib/user'
require './lib/space'
require './lib/request'

class PinkBnB < Sinatra::Base

  enable :sessions, :method_override

  register Sinatra::Flash

  get '/' do
    erb :homepage
  end

  post '/sessions' do
    user = User.authenticate(username: params[:login_username], password: params[:login_password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
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
    user = User.create(name: params[:sign_up_name], username: params[:sign_up_username],
      email: params[:sign_up_email], password: params[:sign_up_password])
    session[:user_id] = user.id
    redirect '/spaces'
  end

  get '/spaces' do
    @user = User.find(id: session[:user_id])
    @possible_hosts = User.all
    @spaces = Space.all
    erb :'spaces/index'
  end

  post '/spaces/new' do
    Space.create(name: params[:name], description: params[:description], price: params[:price_per_night],
      start_date: params[:start_date], end_date: params[:end_date], user_id: session[:user_id])
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/requests' do
    session[:space_id] = params[:space_id]
    @space_id = session[:space_id]
    redirect '/requests/new'
  end

  get '/requests/new' do
    @space = Space.find(id: session[:space_id])
    erb :'requests/new'
  end

  post '/requests/new' do
    space = Space.find(id: session[:space_id])
    Request.create(user_id: session[:user_id], space_id: space.id, date: params[:request_date])
    flash[:notice] = "Thanks for your request"
    redirect '/spaces'
  end

  get '/requests/approve' do
    @requests = Request.all_by_user(user_id: session[:user_id])
    @spaces = @requests.map do |request|
      Space.find(id: request.space_id)
    end
    erb :'requests/approve'
  end

  post '/requests/approve/:id' do
    p params[:id]
    flash[:notice] = "Approved!"
    redirect '/requests/approve'
  end

  run! if app_file == $0
end
