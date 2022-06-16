module Groups
    
  def get_group
    erb :'groups/create_group'
  end

  def post_group
    group = Group.new(name: params[:name],administrator_id: session['admin_id'])
    if group.save then
      redirect to '/admin/landingpage'
    else
      redirect '/admin/group/new'
    end
  end

  def get_group_edit
    @group = Group.find_by(id: params[:id])
    erb :'groups/edit_group'
  end

  def patch_group
    Group.find_by(id: params[:id]).update(name: params['name'])
    redirect to '/admin/landingpage'
  end

  def delete_group
    @group = Group.find_by(id: params[:id])
    if (@group.teams.count == 0) 
      @group.destroy
      redirect to '/admin/landingpage'
    else
      #flash message: this group cant be deleted because it has teams
      flash[:error] = "This group cant be deleted because it has teams"
      redirect to '/admin/groups&teams'
    end
  end

  def get_group_and_team
    erb :'groups/groups_teams'
  end
end