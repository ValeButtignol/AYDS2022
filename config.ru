require 'sinatra'

require_relative './app/controllers/server'
require_relative './app/controllers/players_controller'
require_relative './app/controllers/forecasts_controller'
require_relative './app/controllers/administrators_controller'
use AdministratorsController
use PlayersController
use ForecastsController
run App