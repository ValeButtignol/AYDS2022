require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require 'logger'
require "sinatra/activerecord"
require_relative '../models/init.rb'
require_relative '../helpers/init_helper'


class App < Sinatra::Application

  helpers Init

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
    set :public_folder, './public'
    set :sessions, true
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  end

# Start Page  
  get '/' do
    erb :index
  end

# Configure a before filter to protect private routes!
#  before do
#    if session[:player_id]
#      @current_player = Player.find_by(id: session[:player_id])
#    elsif session[:admin_id]
#      @current_administrator = Administrator.find_by(id: session[:admin_id])
#      administrator_pages = ["/create_group", "/create_team", "/create_match", "/create_result", "/all_groups", "/all_teams", "/all_matches", "/logout"]
#    else
#      public_pages = ["/", "/login", "/signup","/login_admin"]
#      if !public_pages.include?(request.path_info)
#        redirect '/'
#      end
#    end
#  end

################ PLAYERS CONTROLLERS ################

  get '/player/signup' do
    get_signup
  end

  post '/player/signup' do
    post_signup
  end

  get '/player/login' do
    get_login
  end

  post '/player/login' do
    post_login
  end

  get '/logout' do
    get_logout
  end

  get '/player/landingpage' do
    get_landingpage
  end

################ ADMINISTRATORS CONTROLLERS ################

  get '/admin/login' do
    get_admin_login
  end

  post '/admin/login' do
    post_admin_login
  end

  get '/admin/landingpage' do
    get_admin_landingpage
  end

################ GROUPS CONTROLLERS ################

  get '/admin/group/new' do
    get_group
  end

  post '/admin/group/new' do
    post_group
  end

  get '/admin/group/:id/edit' do
    get_group_edit
  end

  patch '/admin/group_edit/:id' do
    patch_group
  end

  delete '/admin/group_delete/:id' do
    delete_group
  end

  get '/player/groups&teams' do
    get_group_and_team
  end

################ TEAMS CONTROLLERS ################

  get '/admin/team/new' do
    get_team
  end

  post '/admin/team/new' do
    post_team
  end

  get '/admin/team/:id/edit' do
    get_team_edit
  end

  patch '/admin/team_edit/:id' do
    patch_team
  end

  delete '/admin/team_delete/:id' do
    delete_team
  end

  get '/admin/groups&teams' do
    get_team_and_group
  end

  ################ MATCHES CONTROLLERS ################

  get '/admin/match/new' do
     get_match
  end

  post '/admin/match/new' do
    post_match
  end

  get '/admin/match/:id/edit' do
    get_match_edit
  end

  patch '/admin/match_edit/:id' do
    patch_match
  end

  delete '/admin/match_delete/:id' do
    delete_match
  end

  get '/admin/matches' do
    get_match_admin
  end

  get '/player/matches' do
    get_match_player
  end

################ FORECASTS CONTROLLERS ################

  get '/player/forecast/new' do
    get_forecast
  end

  post '/player/forecast/new' do
    post_forecast
  end

  get '/player/forecast/:id/edit' do
    get_forecast_edit
  end

  patch '/player/forecast_edit/:id' do
    patch_forecast
  end

  delete '/player/forecast_delete/:id' do
    delete_forecast
  end

  get '/player/forecasts' do
    get_all_forecast
  end

################ RESULTS CONTROLLERS ################

  get '/admin/result/new' do
    get_result
  end

  post '/admin/result/new' do
    post_result
  end

end