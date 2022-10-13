# frozen_string_literal: true

module Results
  def get_result
    erb :'results/create_result'
  end

  def post_result

    result = Result.create(home_goals: params['home_goals'], visitor_goals: params['visitor_goals'], match_id: params['match_id'], administrator_id: session[:admin_id])
    #result = Result.new
    #result.home_goals = params['home_goals']
    #result.visitor_goals = params['visitor_goals']
    #result.match_id = params['match_id']
    #result.administrator_id = session[:admin_id]

    logger.info(result)
    if Result.find_by_id(result.id)
      redirect to '/admin/landingpage'
    else
      redirect '/admin/result/new'
    end
  end
end
