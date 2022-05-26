require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require 'logger'
require "sinatra/activerecord"
require_relative '../models/init.rb'

class App < Sinatra::Application
    
  configure :production, :development do
    enable :logging

    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG if development?
    set :logger, logger
  end
  

  configure :development do
    register Sinatra::Reloader
    after_reload do
      puts 'Reloaded!!!'
      logger.info 'Reloaded!!!'
    end
  end


  def initialize(app = nil)
    super()
  end
    
  configure do
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  end


# Start Page  
  get '/' do
    erb :index
  end



  #CONSULTAR: COMO CONFIGURAR LOS FILTROS?
# Configure a before filter to protect private routes!
#  before do
#    if session[:player_id]
#      @current_player = Player.find_by(id: session[:player_id])
#    else
#      public_pages = ["/", "/login", "/signup"]
#      if !public_pages.include?(request.path_info)
#        redirect '/login'
#      end
#    end
#  end
end