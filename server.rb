require 'sinatra'
require "sinatra/activerecord"
require 'sinatra/reloader'

require_relative 'models/question'
also_reload 'models/question'


get '/' do
  @questions = Question.all
  erb :index
end
