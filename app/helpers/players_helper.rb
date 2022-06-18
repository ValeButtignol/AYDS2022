module Players
  def get_signup
    erb :'/players/signup'
  end
  def post_signup
    # Recieve data from the form inside of params hash.
    # Create a new player and persist it.
  player = Player.new(params)
        
    if player.save then
      session[:player_id] = player.id 
      redirect to '/player/landingpage/:id/edit'
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
      redirect to '/player/landingpage/:id/edit'
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
    @player = Player.find_by(id: params[:id])
    erb :'players/landingpage'
  end

  def delete_player 
    @player = Player.find_by(id: params[:id])
    @player.destroy
    redirect to '/'
  end
end
