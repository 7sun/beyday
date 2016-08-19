require 'sinatra'

get '/' do
  erb :index
end

get '/question-1' do
  @show_hint = to_boolean(params[:show_hint])
  @name = params[:name].strip
  redirect to('/') if @name == ''
  erb :question_1
end

get '/question-2' do
  @show_hint = to_boolean(params[:show_hint])
  @day = params[:day].strip
  @month = params[:month].strip.downcase
  @name = params[:name]
  @month = 'september' if @month == 'sep' || @month == 'sept'

  redirect to("/question-1?show_hint=true&name=#{@name}") if @day != '14' || @month != 'september'
  erb :question_2
end

get '/question-3' do
  @show_hint = to_boolean(params[:show_hint])
  @stadium = params[:stadium].chomp.strip.downcase
  @name = params[:name]

  redirect to("/question-2?show_hint=true&day=14&month=september&name=#{@name}") if @stadium != 'dodger stadium'
  erb :question_3
end

get '/answer' do
  @diva = params[:diva].downcase
  @name = params[:name]
  @diva = 'beyonce' if @diva == 'bey' || @diva == 'b' || @diva == 'queen bey'

  redirect to("/question-3?show_hint=true&stadium=dodger%20stadium&name=#{@name}") if @diva != 'beyonce'
  erb :answer
end

def to_boolean(str)
  str == 'true'
end
