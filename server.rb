require 'sinatra'
require 'sinatra/reloader'
require 'pry'

class Response
  attr_accessor :compliments :colors
  def initialize
    @compliments = [
      "Your instructors love you",
      "High five = ^5",
      "Is it Ruby Tuesday yet?",
      "It's almost beer o'clock",
      "The Force is strong with you"
    ]
  end


  @colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
end

# binding.pry

get '/' do
  compliment = Response.new
  @compliment = compliment.compliments[rand(compliment.compliment.length)]
  haml :compliment
end
