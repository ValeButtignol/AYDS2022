class ForecastsController < Sinatra::Base

  configure do
    set :views, settings.root + '/../views'
    set :sessions, true
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  end

  get '/play' do
    erb :'forecasts/play'
  end

  post '/play' do
    @current_player = Player.find_by(id: session[:player_id])
    new_forecast = @current_player.forecasts.create(home_goals: params[:home_goals], visitor_goals: params[:visitor_goals], match_id: params[:match_id])
    if Forecast.find_by_id(new_forecast.id)
      redirect to '/landingpage'
    else 
      redirect to '/play'
    end
  end

  get '/forecasts' do
    erb :'forecasts/forecasts'
  end
end