# frozen_string_literal: true

module Administrators
  def get_admin_login
    erb :'administrators/login_admin'
  end

  def post_admin_login
    admin = Administrator.find_by(username: params[:username])
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect to '/admin/landingpage'
    else
      flash[:error] = 'Username or password invalid'
      redirect '/admin/login'
    end
  end

  def get_admin_landingpage
    erb :'administrators/landingpage_admin'
  end
end
