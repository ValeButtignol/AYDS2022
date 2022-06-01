require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require 'logger'
require "sinatra/activerecord"
require_relative '../models/init.rb'

class App < Sinatra::Application
    
  configure :production, :development do
    enable :logging

    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG if development?
    set :logger, logger
  end
  

  configure :development do
    register Sinatra::Reloader
    after_reload do
      puts 'Reloaded!!!'
      logger.info 'Reloaded!!!'
    end
  end


  def initialize(app = nil)
    super()
  end
    
  configure do
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  end


# Start Page  
  get '/' do
    erb :index
  end



  #CONSULTAR: COMO CONFIGURAR LOS FILTROS?
# Configure a before filter to protect private routes!
#  before do
#   if session[:player_id]
#     @current_player = Player.find_by(id: session[:player_id])
#   else
#     public_pages = ["/", "/login", "/signup","/login_admin"]
#     if !public_pages.include?(request.path_info)
#       redirect '/'
#     end
#   end
# end


################## ADMINISTRATORS CONTROLLERS ##################


    get '/login_admin' do
      erb :'administrators/login_admin'
    end
  
    post '/login_admin' do
  
      admin = Administrator.find_by(username: params[:username], email: params[:email])

      if admin && admin.authenticate(params[:password])
        session[:admin_id] = admin.id 
        redirect to '/landingpage_admin'
      else
        redirect '/login_admin'
      end

    end

    get '/landingpage_admin' do
      erb :'administrators/landingpage_admin'
    end

################## PLAYERS CONTROLLERS ##################
  get '/signup' do
    erb :'players/signup'
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
  	player = Player.find_by(username: params[:username], email: params[:email])

    if player && player.authenticate(params[:password])
      session[:player_id] = player.id 
      redirect to '/landingpage'
    else
      redirect '/login'
    end
  
    #json = JSON.parse(params)
    #player = Player.find_by(username: json['username'])
    #if player && player.password == json['password']
    #  session[:player_id] = player.id
    #  redirect to "/landingpage"
    #else
    #  redirect to "/login"
    #end
  end

  get '/logout' do
    session.clear
    redirect to '/login'
  end

  get '/landingpage' do
    erb :'players/landingpage'
  end




################## FORECASTS CONTROLLERS ##################

  get '/play' do
    erb :'forecasts/play'
  end

  post '/play' do

    new_forecast = Forecast.new
    new_forecast.player_id = session[:player_id]
    new_forecast.home_goals = params['home_goals']
    new_forecast.visitor_goals = params['visitor_goals']
    new_forecast.match_id = params['match_id']
    
    new_forecast.save

    logger.info(session[:player_id])
    
    logger.info(new_forecast)
    
    if Forecast.find_by_id(new_forecast.id) then
      redirect to '/landingpage'
    else 
      redirect to '/play'
    end
  end

  get '/forecasts' do
    erb :'forecasts/forecasts'
  end







################## MATCHES CONTROLLERS ##################

  get '/matches' do
    erb :'matches/matches'
  end

  get '/groups' do
    erb :'matches/groups'
  end

end