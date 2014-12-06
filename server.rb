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
  redirect "/questions/#{rand(1..Question.count)}"
end

get '/questions/:id' do
  if params[:id].is_i? && params[:id].to_i <= Question.count
    id = params[:id]
  else
    redirect "/questions/#{rand(1..Question.count)}"
  end

  @question = Question.find(id)
  erb :show
end
