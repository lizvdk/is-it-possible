require 'sinatra'
require "sinatra/activerecord"
require 'sinatra/reloader'

class String
  def is_i?
    /\A[-+]?\d+\z/ === self
  end
end

require_relative 'models/question'
also_reload 'models/question'

get '/' do
  redirect "/questions/#{rand(Question.count+1)}"
end

get '/questions/:id' do
  if params[:id].is_i? && params[:id].to_i <= Question.count
    id = params[:id]
  else
    redirect "/questions/#{rand(Question.count+1)}"
  end

  @question = Question.find(id)
  erb :show
end
