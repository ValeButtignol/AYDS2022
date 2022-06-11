class AdministratorsController < Sinatra::Base

get '/admin/login' do
    erb :'administrators/login_admin'
  end

  post '/admin/login' do
    admin = Administrator.find_by(username: params[:username])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id 
      redirect to '/admin/landingpage'
    else
      redirect '/admin/login'
    end
  end

  get '/admin/landingpage' do
    erb :'administrators/landingpage_admin'
  end

end