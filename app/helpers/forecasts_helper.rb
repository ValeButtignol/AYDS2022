# frozen_string_literal: true

module Forecasts
  def get_forecast
    erb :'forecasts/create_forecast'
  end

  #rubocop:disable Metrics/AbcSize
  def post_forecast
    new_forecast = Forecast.create(home_goals: params['home_goals'], visitor_goals: params['visitor_goals'], player_id: session[:player_id], match_id: params['match_id'])
    #new_forecast = Forecast.save
    #new_forecast.player_id = session[:player_id]
    #new_forecast.home_goals = params['home_goals']
    #new_forecast.visitor_goals = params['visitor_goals']
    #new_forecast.match_id = params['match_id']

    #new_forecast.save

    logger.info(session[:player_id])

    logger.info(new_forecast)

    if Forecast.find_by_id(new_forecast.id)
      redirect to '/player/landingpage'
    else
      flash[:error] = 'Invalid forecast'
      redirect to '/player/forecast/new'
    end
  end
  #rubocop:enable Metrics/AbcSize
  
  # Displays the edit form having a forecast param on it.
  def get_forecast_edit
    @forecast = Forecast.find_by(id: params[:id])
    erb :'forecasts/edit'
  end

  # Updates the forecast with the new data.
  def patch_forecast
    Forecast.find_by(id: params[:id]).update(home_goals: params['home_goals'], visitor_goals: params['visitor_goals'])
    redirect to '/player/forecasts'
  end

  # Deletes the forecast.
  def delete_forecast
    Forecast.find_by(id: params[:id]).destroy
    redirect to '/player/forecasts'
  end

  # Displays all the forecasts.
  def get_all_forecast
    erb :'forecasts/all_forecasts'
  end
end
