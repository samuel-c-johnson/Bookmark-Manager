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
    # tag = Tag.first_or_create(name: params[:tag])
    params[:tag].split(', ').each {|single_tag|
       link.tag << Tag.first_or_create(name: single_tag)}
    link.save
    redirect('/')
  end

  post ('/search') do
    redirect ("/tag/#{params[:tag_search]}")
  end

  get ("/tag/:tag_search") do
    tag = Tag.first(name: params[:tag_search])
    @links = (tag ? tag.links : [])
    erb(:searched)

  end

  run! if app_file == $0
end
