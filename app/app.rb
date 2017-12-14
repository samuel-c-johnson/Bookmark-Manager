ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require_relative 'data_mapper_setup'
# require 'database_cleaner'
#
# DatabaseCleaner.strategy = :truncation
#
# # then, whenever you need to clean the DB
# DatabaseCleaner.clean


class BookmarkManager < Sinatra::Base
  get ('/') do
    @links = Link.all
    erb(:index)
  end

  post ('/links') do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tag])
    link.tag << tag
    link.save
    redirect('/')
  end

  run! if app_file == $0
end
