class ForecastsController < Sinatra::Base
    get '/player/forecast/new' do
        erb :'forecasts/create_forecast'
      end
    
      post '/player/forecast/new' do
        new_forecast = Forecast.new
        new_forecast.player_id = session[:player_id]
        new_forecast.home_goals = params['home_goals']
        new_forecast.visitor_goals = params['visitor_goals']
        new_forecast.match_id = params['match_id']
        
        new_forecast.save
    
        logger.info(session[:player_id])
        
        logger.info(new_forecast)
        
        if Forecast.find_by_id(new_forecast.id) then
          redirect to '/player/landingpage'
        else 
          # Flash message: Invalid forecast
          redirect to '/player/forecast/new'
        end
      end
    
      # Displays the edit form having a forecast param on it.
      get '/player/forecast/:id/edit' do
        @forecast = Forecast.find_by(id: params[:id])
        erb :'forecasts/edit'
      end
    
      # Updates the forecast with the new data.
      patch '/player/forecast_edit/:id' do
        Forecast.find_by(id: params[:id]).update(home_goals: params['home_goals'], visitor_goals: params['visitor_goals'])
        redirect to '/player/forecasts'
      end
    
      # Deletes the forecast.
      delete '/player/forecast_delete/:id' do
        Forecast.find_by(id: params[:id]).destroy
        redirect to '/player/forecasts'
      end
    
      # Displays all the forecasts.
      get '/player/forecasts' do
        erb :'forecasts/all_forecasts'
      end
end