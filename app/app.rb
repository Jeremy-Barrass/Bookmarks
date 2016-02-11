require 'sinatra/base'
require './app/models/link'
require_relative 'models/tag'
require_relative 'data_mapper_setup'


ENV['RACK_ENV'] ||= 'development'

class Bookmark < Sinatra::Base

  get '/' do
    'Hello Bookmark!'
  end

  get '/links' do
    @links = Link.all
    erb :'/links/index'
  end

  get '/links/new' do
    erb :'/links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
      params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
      end
      link.save
      redirect to('/links')
end
  get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb :'links/index'
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
