class AdministratorsController < Sinatra::Base

    configure do
      set :views, settings.root + '/../views'
      set :sessions, true
      set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    end
  
    # This model will be responsable for anything involving our players as
    # signup, login, logout, redirect to create forecast, redirect to watch 
    # matches, etc.
  
    # signup -> new session (get and post request)
      # get for render the signup form
      # post for process the signup form
  
    # login -> read session ()
    # logout -> delete actual session
  
    get '/login_administrator' do
      erb :'administrators/signup_administrator'
    end
  
    post '/login_administrator' do
      # Recieve data from the form inside of params hash.
      # Create a new player and persist it.
     administrator = Administrator.new(params)

    end
      
  end
  