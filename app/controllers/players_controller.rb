class PlayersController < App

  # This model will be responsable for anything involving our players as
  # signup, login, logout, redirect to create forecast, redirect to watch 
  # matches, etc.

  # signup -> new session (get and post request)
    # get for render the signup form
    # post for process the signup form

  # login -> read session ()
  # logout -> delete actual session

  get '/signup' do
    erb :"players/signup"
  end

  post '/signup' do
    # Recieve data from the form inside of params hash.
    # Create a new player and persist it.
    player = Player.new(params)

    if player.save then
      redirect to '/login'
    else
      redirect to '/signup'
    end
  end


  get '/login' do
    erb :'players/login'
  end

  post '/login' do
    json = JSON.parse(request.body.read)
    player = Player.find_by(username: json['username'])
    if player && player.password == json['password']
      session[:player_id] = player.id
      redirect to "/landingpage"
    else
      redirect to "/login"
    end
  end
end
