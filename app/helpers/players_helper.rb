# frozen_string_literal: true

module Players
  def get_signup
    erb :'/players/signup'
  end

  def post_signup
    # Recieve data from the form inside of params hash.
    # Create a new player and persist it.
    player = Player.new(params)
    if player.save
      session[:player_id] = player.id
      redirect to '/player/landingpage'
    else
      # Flash message: username invalid
      flash[:error] = 'Username invalid'
      redirect to '/player/signup'
    end
  end

  def get_login
    erb :'players/login'
  end

  #rubocop:disable Metrcis/AbcSize
  #rubocop:disable Metrcis/MethodLength
  def post_login
    admin = Administrator.find_by(username: params[:username])
    player = Player.find_by(username: params[:username])

    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect to '/admin/landingpage'

    elsif player&.authenticate(params[:password])
      session[:player_id] = player.id
      redirect to '/player/landingpage'

    else
      flash[:error] = 'Username or password invalid'
      redirect '/player/login'
    end
  end
  #rubocop:enable Metrcis/AbcSize
  #rubocop:enable Metrcis/MethodLength

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

  def get_all_players
    @player = Player.find_by(id: params[:id])
    erb :'players/all_players'
  end

  def get_profile(username)
    @player = Player.find_by(username: username)
    erb :'players/player_profile'
  end

  def get_player_search
    @player = Player.find_by(id: params[:id])
    erb :'players/search'
  end

  def post_player_search
    player = Player.find_by(username: params[:username])
    if player
      redirect to "/player/search/#{params[:username]}"
    else
      flash[:error] = "User doesn't exist"
      redirect to '/player/search'
    end
  end
end
