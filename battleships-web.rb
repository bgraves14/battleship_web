
get '/' do
  erb :index
end
get ‘/start-game’ do
    $game = Game.new
    $game.start
    erb: board
end
