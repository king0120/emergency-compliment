require 'sinatra'
require 'sinatra/reloader'
require 'pry'

class Response
  attr_accessor :compliments, :colors
  def initialize
    @compliments = [
      "Your instructors love you",
      "High five = ^5",
      "Is it Ruby Tuesday yet?",
      "It's almost beer o'clock",
      "The Force is strong with you",
      "Coworkers fantasizes about getting stuck in the elevator with you."
    ]
    @colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]

  end

end

$response = Response.new


get '/' do
  @compliment = $response.compliments[rand($response.compliments.length)]
  @color = $response.colors[rand($response.colors.length)]
  @name_render = false
  haml :compliment
end

post '/' do
  # new_compliment
  if params[:new_compliment].length > 0
  $response.compliments << params[:new_compliment]
  end

  if params[:new_background].length > 0
    $response.colors << params[:new_background]
  end
  @compliment = $response.compliments[rand($response.compliments.length)]
  @color = $response.colors[rand($response.colors.length)]
  @name_render = false
  haml :compliment
end

get '/:name'  do
  @name = params[:name].capitalize
  @name_render = true
  @compliment = $response.compliments[rand($response.compliments.length)]
  @color = $response.colors[rand($response.colors.length)]
  # @student_email = params[:email]
  haml :compliment
end
