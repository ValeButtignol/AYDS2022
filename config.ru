require 'sinatra'
require_relative './app/controllers/server'
use Rack::MethodOverride
run App