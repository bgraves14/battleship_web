require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  set :views, Proc.new { File.join(root, "..", "views") }
  enable :sessions

  get '/' do
    erb :index
  end

  get '/name' do
    @player = params[:name]
    session[:name] = @player
    erb :name
  end

  get '/game' do
    $game = Game.new(Player, Board)
    @player = session[:name]
    $game.player_2.place_ship Ship.destroyer, 'A1', :vertically
    erb :game
  end

  post '/game' do
    @ship = params[:ship]
    @coordinate = params[:coordinate]
    @direction = params[:direction]
    $game.player_1.place_ship Ship.send(@ship), @coordinate.capitalize, @direction.to_sym
    puts @shoot_at
    erb :game
  end

  get '/play_single' do
    erb :play_single
  end

  post '/play_single' do
    erb :play_single
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
