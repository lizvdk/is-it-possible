require 'sinatra'
require "sinatra/activerecord"
require 'sinatra/reloader'
require 'pry'

class String
  def is_i?
    /\A[-+]?\d+\z/ === self
  end
end

require_relative 'models/question'
also_reload 'models/question'

get '/' do
  redirect "/questions/#{rand(1..Question.count)}"
end

get '/questions/:id' do
  if params[:id].is_i? && params[:id].to_i <= Question.count
    id = params[:id]
  else
    redirect "/questions/#{rand(1..Question.count)}"
  end

  @question = Question.find(id)
  @total = @question.yes + @question.no
  if @total > 0
    @percent = @question.yes / @total
  else
    @percent = 'no answers yet'
  end
  erb :show
end

post '/questions/:id' do
  id = params[:id]
  question = Question.find(id)
  if params[:yes] == 'true'
    question.update_attribute(:yes, + 1)
  else
    question.update_attribute(:no, + 1)
  end
  @question = Question.find(id)
  @total = @question.yes + @question.no
  erb :show
end
