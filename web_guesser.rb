require 'sinatra'
require 'sinatra/reloader'

# set :num, rand(101)
SECRET_NUMBER = rand(100)

def check_guess(guess)
  message = case
  when (params['guess'].to_i - 5) > SECRET_NUMBER then "Way too high!"
  when (params['guess'].to_i + 5) < SECRET_NUMBER then "Way too low!"
  when params['guess'].to_i > SECRET_NUMBER       then "Too high!"
  when params['guess'].to_i < SECRET_NUMBER       then "Too low!"
  when params['guess'].to_i == SECRET_NUMBER      then "You go it right!"
  end
end

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

# def assign_number
#   @num = rand(101) if @num.nil?
# end
