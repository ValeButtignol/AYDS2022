class TeamsController < Sinatra::Base
    
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
    
      get '/admin/team/:id/edit' do
        @team = Team.find_by(id: params[:id])
        erb :'teams/edit_team'
      end
    
      patch '/admin/team_edit/:id' do
        Team.find_by(id: params[:id]).update(name: params['name'], group_id: params['group_id'], administrator_id: params['admin_id']) 
        redirect to '/admin/landingpage'
      end
    
      delete '/admin/team_delete/:id' do
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
        erb :'teams/groups_teams'
      end
end