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
      "Coworkers fantasizes about getting stuck in the elevator with you.",
      'You\'re funny. Like, LOL style.',
      'Your voice sounds like a thousand cats purring. Also, I\'m on acid.',
      'You think of the funniest names for wi-fi networks.',
      'People at trivia night are terrified of you.',
      "You could open that jar of mayonnaise using only 3 fingers.",
      "Strangers all wanna sit next to you on the bus.",
      "Coworkers fantasizes about getting stuck in the elevator with you.",
      "If Einstein could meet you, he'd be mildly to moderately intimidated.",
      "At least two friends are going to name their child and/or goldfish after you.",
      "socks + sandals + you = I'm into it.",
      "Your ex thought about you this morning, then they thought about donuts.",
      "You are freakishly good at thumb wars.",
      "A 3rd tier cable network would totally create a television show about you.",
      "The FBI tapped your phone just to hear the sound of your voice.",
      "You remind everyone of kiwis- delicious and surprisingly fuzzy.",
      "You never forget to fill the ice-cube tray.",
      "People enjoy you accidentally touching their butt while putting on your seat-belt.",
      "I’d give you the last piece of my gum even if I’d just ate garlic.",
      "There was a high school rumor that you are a distant relative of Abraham Lincoln.",
      "You could make up a weird religion or diet and everyone would follow it.",
      "Your siblings are pissed that your photo is the star of your parent's mantle.",
      " Everyone at sleepovers thought you were the bravest during thunderstorms.",
      "A doctor once saw your butt through the hospital gown. They approve!",
      "Someone almost got a tattoo of your name once, but their mom talked them out of it.",
      "You are your parent's greatest accomplishment, unless they invented the spork.",
      "Some dudes hope you start a band so they can start a cover band of that band.",
      "Your principal would call you to the office just to look cool.",
      "Your allergies are some of the least embarrassing allergies.",
      "Your handshake conveys intelligence, confidence and minor claminess.",
      "Cops admire your ability to stay a perfect 3-5 miles above the speed limit.",
      "You rarely have to go to the bathroom when you fly in the window seat.",
      "Your roommate wants a lock of your hair but is afraid to ask.",
      "Cockroaches, mice and other pests avoid your place out of respect.",
      "Callers are intimidated by how funny your voicemail greeting is.",
      "Kids think you are the “cool old person”.",
      "People always think your jeggings are regular jeans.",
      "80% of motorcycle gangs think you’d be a delightful sidecar.",
      "Everyone at the laundromat thinks you have the cutest underwear.",
      "People behind you at movies think you are the perfect height.",
      "Your parents argue over which one of them you look like.",
      "Sushi chefs are wowed by your chopstick dexterity.",
      "You want the best for everyone...except Gary.",
      "You are someone's the one that got away."]
    @colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080",'#0080ff', '#F44336', '#FFEBEE', '#FFCDD2', '#EF9A9A', '#E57373', '#EF5350', '#F44336', '#E53935', '#D32F2F', '#C62828', '#B71C1C', '#FF8A80', '#FF5252', '#FF1744', '#D50000', '#E91E63', '#FCE4EC', '#F8BBD0', '#F48FB1', '#F06292', '#EC407A', '#E91E63', '#D81B60', '#C2185B', '#AD1457', '#880E4F', '#FF80AB', '#FF4081', '#F50057', '#C51162', '#9C27B0', '#F3E5F5', '#E1BEE7', '#CE93D8', '#BA68C8', '#AB47BC', '#9C27B0', '#8E24AA', '#7B1FA2', '#6A1B9A', '#4A148C', '#EA80FC', '#E040FB', '#D500F9', '#AA00FF', '#673AB7', '#EDE7F6', '#D1C4E9', '#B39DDB', '#9575CD', '#7E57C2', '#673AB7', '#5E35B1', '#512DA8', '#4527A0', '#311B92', '#B388FF', '#7C4DFF', '#651FFF', '#6200EA', '#3F51B5', '#E8EAF6', '#C5CAE9', '#9FA8DA', '#7986CB', '#5C6BC0', '#3F51B5', '#3949AB', '#303F9F', '#283593', '#1A237E', '#8C9EFF', '#536DFE', '#3D5AFE', '#304FFE', '#2196F3', '#E3F2FD', '#BBDEFB', '#90CAF9', '#64B5F6', '#42A5F5', '#2196F3', '#1E88E5', '#1976D2', '#1565C0', '#0D47A1', '#82B1FF', '#448AFF', '#2979FF', '#2962FF', '#03A9F4', '#E1F5FE', '#B3E5FC', '#81D4FA', '#4FC3F7', '#29B6F6', '#03A9F4', '#039BE5', '#0288D1', '#0277BD', '#01579B', '#80D8FF', '#40C4FF', '#00B0FF', '#0091EA', '#00BCD4', '#E0F7FA', '#B2EBF2', '#80DEEA', '#4DD0E1', '#26C6DA', '#00BCD4', '#00ACC1', '#0097A7', '#00838F', '#006064', '#84FFFF', '#18FFFF', '#00E5FF', '#00B8D4', '#009688', '#E0F2F1', '#B2DFDB', '#80CBC4', '#4DB6AC', '#26A69A', '#009688', '#00897B', '#00796B', '#00695C', '#004D40', '#A7FFEB', '#64FFDA', '#1DE9B6', '#00BFA5', '#4CAF50', '#E8F5E9', '#C8E6C9', '#A5D6A7', '#81C784', '#66BB6A', '#4CAF50', '#43A047', '#388E3C', '#2E7D32', '#1B5E20', '#B9F6CA', '#69F0AE', '#00E676', '#00C853', '#8BC34A', '#F1F8E9', '#DCEDC8', '#C5E1A5', '#AED581', '#9CCC65', '#8BC34A', '#7CB342', '#689F38', '#558B2F', '#33691E', '#CCFF90', '#B2FF59', '#76FF03', '#64DD17', '#CDDC39', '#F9FBE7', '#F0F4C3', '#E6EE9C', '#DCE775', '#D4E157', '#CDDC39', '#C0CA33', '#AFB42B', '#9E9D24', '#827717', '#F4FF81', '#EEFF41', '#C6FF00', '#AEEA00', '#FFEB3B', '#FFFDE7', '#FFF9C4', '#FFF59D', '#FFF176', '#FFEE58', '#FFEB3B', '#FDD835', '#FBC02D', '#F9A825', '#F57F17', '#FFFF8D', '#FFFF00', '#FFEA00', '#FFD600', '#FFC107', '#FFF8E1', '#FFECB3', '#FFE082', '#FFD54F', '#FFCA28', '#FFC107', '#FFB300', '#FFA000', '#FF8F00', '#FF6F00', '#FFE57F', '#FFD740', '#FFC400', '#FFAB00', '#FF9800', '#FFF3E0', '#FFE0B2', '#FFCC80', '#FFB74D', '#FFA726', '#FF9800', '#FB8C00', '#F57C00', '#EF6C00', '#E65100', '#FFD180', '#FFAB40', '#FF9100', '#FF6D00', '#FF5722', '#FBE9E7', '#FFCCBC', '#FFAB91', '#FF8A65', '#FF7043', '#FF5722', '#F4511E', '#E64A19', '#D84315', '#BF360C', '#FF9E80', '#FF6E40', '#FF3D00', '#DD2C00', '#795548', '#EFEBE9', '#D7CCC8', '#BCAAA4', '#A1887F', '#8D6E63', '#795548', '#6D4C41', '#5D4037', '#4E342E', '#3E2723', '#9E9E9E', '#FAFAFA', '#F5F5F5', '#EEEEEE', '#E0E0E0', '#BDBDBD', '#9E9E9E', '#757575', '#616161', '#424242', '#212121', '#607D8B', '#ECEFF1', '#CFD8DC', '#B0BEC5', '#90A4AE', '#78909C', '#607D8B', '#546E7A', '#455A64', '#37474F', '#263238', '#000000', '#FFFFFF',]

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
