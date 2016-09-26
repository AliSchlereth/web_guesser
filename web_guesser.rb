require 'sinatra'
require 'sinatra/reloader'

set :num, rand(101)

get '/' do
  "The secret number is #{settings.num}"
end
