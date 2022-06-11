class GroupsController < Sinatra::Base
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
        redirect to '/admin/landingpage'
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


end