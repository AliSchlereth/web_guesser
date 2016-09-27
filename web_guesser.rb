require 'sinatra'
require 'sinatra/reloader'
require 'pry'

# set :num, rand(101)
SECRET_NUMBER = rand(100)

def check_guess(guess)
  message = case
  when (params['guess'].to_i - 5) > SECRET_NUMBER then "Way too high!"
  when (params['guess'].to_i + 5) < SECRET_NUMBER then "Way too low!"
  when params['guess'].to_i > SECRET_NUMBER       then "Too high!"
  when params['guess'].to_i < SECRET_NUMBER       then "Too low!"
  when params['guess'].to_i == SECRET_NUMBER      then "You got it right!"
  end
end

def check_for_color(message)
  if message == "Way too high!" || message == "Way too low!"
    "red"
  elsif message == "Too high!"  || message==  "Too low!"
    "pink"
  else
    "green"
  end
end

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  color = check_for_color(message)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color}
end

# def assign_number
#   @num = rand(101) if @num.nil?
# end
