require 'sinatra/base'


class BattleshipsWeb < Sinatra::Base
  set :views, Proc.new { File.join(root, "..", "views") }
  enable :sessions 

  get '/' do
    erb :index
  end

  get '/name' do
    @player = params[:name]
    session[:name]
    erb :name
  end

  get '/game' do
    @player = params[:name]
    session[:name]
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end