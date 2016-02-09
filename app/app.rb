require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    @Links = Link.all
    p @Links[0]
    erb :home
  end
end
