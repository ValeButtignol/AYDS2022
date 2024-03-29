require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require 'logger'
require 'sinatra/activerecord'
require 'sinatra/flash'
require_relative '../models/init'
require_relative '../helpers/players_helper'
require_relative '../helpers/administrators_helper'
require_relative '../helpers/teams_helper'
require_relative '../helpers/groups_helper'
require_relative '../helpers/forecasts_helper'
require_relative '../helpers/results_helper'
require_relative '../helpers/matches_helper'

class App < Sinatra::Application
  helpers Players
  helpers Administrators
  helpers Forecasts
  helpers Teams
  helpers Groups
  helpers Results
  helpers Matches

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

  def initialize(_app = nil)
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
  before do
    administrator_pages = ['/admin/landingpage', '/admin/group/new', '/admin/group/:id/edit',
                           '/admin/team/:id/edit', '/admin/team/new', '/admin/groups&teams', '/admin/match/new',
                           '/admin/match/:id/edit', '/admin/matches', '/admin/result/new', '/admin/logout']
    logger.info(session)
    if session[:player_id] && Player.find_by_id(session[:player_id])
      redirect '/player/landingpage' if administrator_pages.include?(request.path_info)
    elsif session[:admin_id] && Administrator.find_by_id(session[:admin_id])
      redirect to '/admin/landingpage' unless administrator_pages.include?(request.path_info)
    else
      public_pages = ['/', '/player/login', '/player/signup']
      redirect to '/' unless public_pages.include?(request.path_info)
    end
  end


  ################ PAGE INFORMATIO ################

  get '/information' do
    erb :information
  end

  get '/informationWorld' do
    erb :informationWorld
  end

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

  get '/player/search' do
    get_player_search
  end

  post '/player/search' do
    post_player_search
  end

  get '/player/search/:username' do
    get_profile(params[:username])
  end

  get '/logout' do
    get_logout
  end

  get '/player/players' do
    get_all_players
  end

  get '/player/landingpage' do
    get_landingpage
  end

  delete '/player/delete/:id' do
    delete_player
  end

  ################ ADMINISTRATORS CONTROLLERS ################

  get '/admin/login' do
    get_admin_login
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

  get '/team/search/:name' do
    get_profile_teams(params[:name])
  end

  get '/team/search' do
    get_team_search
  end

  post '/team/search' do
    post_search_team
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

  get '/player/matches/:id' do
    get_match_details
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
