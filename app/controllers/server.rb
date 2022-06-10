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


################## ADMINISTRATORS CONTROLLERS ##################

  get '/admin/login' do
    erb :'administrators/login_admin'
  end

  post '/admin/login' do
    admin = Administrator.find_by(username: params[:username])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id 
      redirect to '/admin/landingpage'
    else
      redirect '/admin/login'
    end
  end

  get '/admin/landingpage' do
    erb :'administrators/landingpage_admin'
  end

################## GROUPS CONTROLLERS ##################

  get '/admin/group/new' do
    erb :'groups/create_group'
  end

  post '/admin/group/new' do
    group = Group.new(name: params[:name],administrator_id: session['admin_id'])
    if group.save then
      redirect to '/admin/landingpage'
    else
      redirect '/admin/group/new'
    end
  end

  get '/admin/group/:id/edit' do
    @group = Group.find_by(id: params[:id])
    erb :'groups/edit_group'
  end

  patch '/admin/group_edit/:id' do
    Group.find_by(id: params[:id]).update(name: params['name'])
    redirect to '/landingpage_admin'
  end

  delete '/admin/group_delete/:id' do
    @group = Group.find_by(id: params[:id])
    if (@group.teams.count == 0) 
      @group.destroy
      redirect to '/admin/landingpage'
    else
      #flash message: this group cant be deleted because it has teams
      redirect to '/admin/groups&teams'
    end
  end

  get '/player/groups&teams' do
    erb :'groups/groups_teams'
  end

################## TEAMS CONTROLLERS ##################

  get '/admin/team/new' do
    erb :'teams/create_team'
  end

  post '/admin/team/new' do
    team = Team.new
    team.name= params[:name]
    team.group_id= params[:group_id]
    team.administrator_id = session[:admin_id]

    if team.save then
      redirect to '/admin/landingpage'
    else
      redirect '/admin/team/new'
    end
  end

  get '/admin/teams/:id/edit' do
    @team = Team.find_by(id: params[:id])
    erb :'teams/edit_team'
  end

  patch '/admin/teams_edit/:id' do
    Team.find_by(id: params[:id]).update(name: params['name'], group_id: params['group_id'], administrator_id: params['admin_id']) 
    redirect to '/all_teams'
  end

  delete '/admin/teams_delete/:id' do
    @team = Team.find_by(id: params[:id])
    @matches = Match.all
    had_match = false
    @matches.each do |m|
      if m.home_team == @team.id || m.visitor_team == @team.id
        had_match = true
      end
    end
        
    if had_match then
      #flash message: Cannot delete this team because it has matches
      redirect to '/admin/groups&teams'
    else
      @team.destroy
      redirect to '/admin/landingpage'
    end
  end

  get '/admin/groups&teams' do
    erb :'teams/all_teams'
  end

################## RESULTS CONTROLLERS ##################

  get '/admin/result/new' do
    erb :'results/create_result'
  end

  post '/admin/result/new' do
    result = Result.new
    result.home_goals = params['home_goals']
    result.visitor_goals = params['visitor_goals']
    result.match_id = params['match_id']
    result.administrator_id = session[:admin_id]
    
    #Flash message: Are you sure you want to create this result?
    logger.info(result)
    if result.save then
      redirect to '/admin/landingpage'
    else
      redirect '/admin/result/new' 
    end
  end


################## PLAYERS CONTROLLERS ##################
  get '/player/signup' do
    erb :'players/signup'
  end

  post '/player/signup' do
    # Recieve data from the form inside of params hash.
    # Create a new player and persist it.
    player = Player.new(params)
    
    if player.save then
      redirect to '/login'
    else
      redirect to '/signup'
    end
  end


  get '/player/login' do
    erb :'players/login'
  end

  post '/player/login' do
  	player = Player.find_by(username: params[:username])

    if player && player.authenticate(params[:password])
      session[:player_id] = player.id 
      redirect to '/landingpage'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

  get '/player/landingpage' do
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

  # Displays the edit form having a forecast param on it.
  get '/forecasts/:id/edit' do
    @forecast = Forecast.find_by(id: params[:id])
    erb :'forecasts/edit'
  end

  # Updates the forecast with the new data.
  patch '/forecasts/:id' do
    Forecast.find_by(id: params[:id]).update(home_goals: params['home_goals'], visitor_goals: params['visitor_goals'])
    redirect to '/forecasts'
  end

  # Deletes the forecast.
  delete '/forecasts/:id' do
    Forecast.find_by(id: params[:id]).destroy
    redirect to '/forecasts'
  end

  # Displays all the forecasts.
  get '/forecasts' do
    erb :'forecasts/all_forecasts'
  end


################## MATCHES CONTROLLERS ##################

  get '/create_match' do
    erb :'matches/create_match' 
  end

  post '/create_match' do
    match = Match.new
    match.administrator_id = session[:admin_id]
    match.stadium = params['stadium']
    match.date = params['date']
    match.home_team_id = params['home_team_id']
    match.visitor_team_id = params['visitor_team_id']
    match.match_type = params['match_type']

    # Flash message: Are you sure you want to create this match?

    logger.info(session)
   
    if match.save then
      redirect to '/landingpage_admin'
    else
      redirect '/create_match'
    end
  end
  
  get '/all_matches/:id/edit' do
    @match = Match.find_by(id: params[:id])
    erb :'matches/edit_match'
  end
  
  patch '/all_matches_edit/:id' do
    Match.find_by(id: params[:id]).update(home_team_id: params['home_team_id'],visitor_team_id: params['visitor_team_id'],stadium: params['stadium'], date: params['date'], match_type: params['match_type'])
    redirect to '/all_matches'
  end
  
  delete '/all_matches_delete/:id' do
    @match = Match.find_by(id: params[:id])
    if (@match.forecasts.count == 0 && @match.result == nil)
      @match.destroy
      redirect to '/landingpage_admin'
    else
      #Flash message
      redirect to '/all_matches'
    end  
  end

  get '/all_matches' do
    erb :'matches/all_matches_admin'
  end

  # Show all the not played matches and the matches to play.
  get '/matches' do
    erb :'matches/all_matches'
  end

end