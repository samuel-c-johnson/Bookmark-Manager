ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/link.rb'

class BookmarkManager < Sinatra::Base
  get ('/') do
    @links = Link.all
    erb(:index)
  end

  post ('/links') do
    Link.create(url: params[:url], title: params[:title])
    redirect('/')
  end

  run! if app_file == $0
end
