# frozen_string_literal: true

# module Teams
module Teams
  def team
    erb :'teams/create_team'
  end

  def post_team
    team = Team.new
    team.name = params[:name]
    team.group_id = params[:group_id]
    team.administrator_id = session[:admin_id]

    if team.save
      redirect to '/admin/landingpage'
    else
      redirect '/admin/team/new'
    end
  end

  def team_edit
    @team = Team.find_by(id: params[:id])
    erb :'teams/edit_team'
  end

  def patch_team
    Team.find_by(id: params[:id]).update(name: params['name'], group_id: params['group_id'],
                                         administrator_id: params['admin_id'])
    redirect to '/admin/landingpage'
  end

  #rubocop:disable Metrics/AbcSize
  #rubocop:disable Metrics/MethodLength
  def delete_team
    @team = Team.find_by(id: params[:id])
    @matches = Match.all
    had_match = false
    @matches.each do |m|
      had_match = true if m.home_team_id == @team.id || m.visitor_team_id == @team.id
    end
    if had_match
      flash[:error] = 'Cannot delete this team because it has associated matches'
      redirect to '/admin/groups&teams'
    else
      @team.destroy
      redirect to '/admin/landingpage'
    end
  end
  #rubocop:enable Metrics/AbcSize
  #rubocop:enable Metrics/MethodLength

  def team_and_group
    erb :'teams/groups_teams'
  end

  def team_search
    erb :'teams/search_team'
  end

  def profile_teams(name)
    @team = Team.find_by(name: name)
    erb :'teams/team_profile'
  end

  def post_search_team
    team = Team.find_by(name: params[:name].upcase)
    if team
      redirect to "/team/search/#{params[:name].upcase}"
    else
      flash[:error] = "Team doesn't exist"
      redirect to '/team/search'
    end
  end
end
