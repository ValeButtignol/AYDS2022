module Players
  def get_signup
    erb :'/players/signup'
  end
  def post_signup
    # Recieve data from the form inside of params hash.
    # Create a new player and persist it.
  player = Player.new(params)
        
    if player.save then
      redirect to '/player/login'
    else
      # Flash message: username invalid
      flash[:error] = "Username invalid"
      redirect to '/player/signup'
    end
  end
  def get_login
    erb :'players/login'
  end
  def post_login
    player = Player.find_by(username: params[:username])
  
    if player && player.authenticate(params[:password])
      session[:player_id] = player.id 
      redirect to '/player/landingpage'
    else
      # Flash message: Username or password invalid
      flash[:error] = "Username or password invalid"
      redirect '/player/login'
    end
  end
  def get_logout
    session.clear
    redirect to '/'
  end
  def get_landingpage
    erb :'players/landingpage'
  end
end
