require 'sinatra'
require 'sinatra/reloader'

require_relative 'lib/execution_container'

get '/' do
  slim :index
end

get '/exec' do
  r = ExecutionContainer.new()
  r.exec.to_s
end

post '/exec' do
  p params[:language]
  p params[:program]
  p params[:stdin]
  redirect '/', 303
end
