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
