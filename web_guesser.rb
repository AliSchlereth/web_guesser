require 'sinatra'
require 'sinatra/reloader'

# set :num, rand(101)
number = rand(101)

get '/' do
  erb :index, :locals => {:number => number}
end

# def assign_number
#   @num = rand(101) if @num.nil?
# end
