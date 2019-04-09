require 'sinatra/base'

class PinkBnB < Sinatra::Base
  get '/' do
    "Hello world"
  end

  run! if app_file == $0
end