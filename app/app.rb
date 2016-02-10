ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'


class Bookmark < Sinatra::Base

  get '/link' do
    @link = Link.all
    erb :index
  end

  get '/link/add-new' do
    erb :add_new
  end

  post '/link' do
    Link.create(url: params[:url], title: params[:bookmark_name])
    redirect to ('/link')
  end

  post '/tagging' do
    Tag.create
  end

  get '/link/add-tag' do
    erb :add_tag
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
