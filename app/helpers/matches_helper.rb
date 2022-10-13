# frozen_string_literal: true

module Matches
  def get_match
    erb :'matches/create_match'
  end

  #rubocop:disable Metrics/AbcSize
  def post_match
    match = Match.create(administrator_id: session[:admin_id], stadium: params['stadium'], date: params['date'], home_team_id: params['home_team_id'], visitor_team_id: params['visitor_team_id'], match_type: params['match_type'])
    #match = Match.new
    #match.administrator_id = session[:admin_id]
    #match.stadium = params['stadium']
    #match.date = params['date']
    #match.home_team_id = params['home_team_id']
    #match.visitor_team_id = params['visitor_team_id']
    #match.match_type = params['match_type']
    
    logger.info(session)

    if Match.find_by_id(match.id)
      redirect to '/admin/landingpage'
    else
      redirect '/admin/match/new'
    end
  end
  #rubocop:enable Metrics/AbcSize


  def get_match_edit
    @match = Match.find_by(id: params[:id])
    erb :'matches/edit_match'
  end

  def patch_match
    Match.find_by(id: params[:id]).update(home_team_id: params['home_team_id'],
                                          visitor_team_id: params['visitor_team_id'], stadium: params['stadium'], date: params['date'], match_type: params['match_type'])
    redirect to '/admin/matches'
  end

  def delete_match
    @match = Match.find_by(id: params[:id])
    if @match.forecasts.count.zero? && @match.result.nil?
      @match.destroy
      redirect to '/admin/landingpage'
    else
      # Flash message
      flash[:error] = 'This match cannot be deleted because it has an associated result or prediction'
      redirect to '/admin/matches'
    end
  end

  def get_match_admin
    erb :'matches/matches_admin'
  end

  # Show all the not played matches and the matches to play.
  def get_match_player
    erb :'matches/matches_player'
  end
end
