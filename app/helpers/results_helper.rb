class ResultsController < Sinatra::Base
   
  configure do
    set :views, 'app/views'
  end

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
    
end