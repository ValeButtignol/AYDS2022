require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require 'logger'
require "sinatra/activerecord"

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

    def initialize(app = nil)
      super()
    end

    class Account

      @firstName = "default_name"
      @lastName = "default_name"
      @dni = 0
      @email = "default_name"

      #Constructor
      def initialize(firstName,lastName,dni,email)
     @firstName = firstName
     @lastName = lastName
     @dni = dni
     @email = email

     end

   end
  #comentario testeo
     class User < Account 

      @num = 0

    end

    class Administrador < Account

      @num = 0
    end

    class Team

      @name = "default_name"
      @players = 0

    end

    class Match

      @time = 0
      @stadium = "default_stadium"
      @num = 0
      @date = 0

    end

    #
    # class Bet 
    #  
    #
    # @id = 0
    #
    # end

    # class Result 
    #
    # end

  
    get '/' do
      "Hola Juan"
    end 

  end
end
