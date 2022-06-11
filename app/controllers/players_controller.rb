class PlayersController < Sinatra::Base

    get '/player/signup' do
        erb :'/players/signup'
    end

    post '/player/signup' do
        # Recieve data from the form inside of params hash.
        # Create a new player and persist it.
        player = Player.new(params)
        
        if player.save then
          redirect to '/player/login'
        else
          # Flash message: username invalid
          redirect to '/player/signup'
        end
      end
    
      get '/player/login' do
        erb :'players/login'
      end
    
      post '/player/login' do
        player = Player.find_by(username: params[:username])
  
      if player && player.authenticate(params[:password])
        session[:player_id] = player.id 
        redirect to '/player/landingpage'
      else
        # Flash message: Username or password invalid
        redirect '/player/login'
      end
    end
  
    get '/logout' do
      session.clear
      redirect to '/'
    end
  
    get '/player/landingpage' do
      erb :'players/landingpage'
    end
   
end
