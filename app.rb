require 'sinatra'
require 'sinatra/reloader'

get '/' do
  slim :index
end
