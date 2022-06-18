module Teams

  def get_team
    erb :'teams/create_team'
  end
    
  def post_team
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
    
  def get_team_edit
    @team = Team.find_by(id: params[:id])
    erb :'teams/edit_team'
  end

  def patch_team
    Team.find_by(id: params[:id]).update(name: params['name'], group_id: params['group_id'], administrator_id: params['admin_id']) 
    redirect to '/admin/landingpage'
  end

  def delete_team
    @team = Team.find_by(id: params[:id])
    @matches = Match.all
    had_match = false
    @matches.each do |m|
      if m.home_team_id == @team.id || m.visitor_team_id == @team.id
        had_match = true
      end
    end
        
    if had_match then
      flash[:error] = "Cannot delete this team because it has associated matches"
      redirect to '/admin/groups&teams'
    else
      @team.destroy
      redirect to '/admin/landingpage'
    end
  end

  def get_team_and_group
    erb :'teams/groups_teams'
  end
end