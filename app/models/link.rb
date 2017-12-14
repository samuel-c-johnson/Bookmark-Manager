require 'data_mapper'
require 'dm-postgres-adapter'
# require_relative '../data_mapper_setup'
# require 'tag'

class Link
  include DataMapper::Resource
  has n, :tag, through: Resource
  property :id,    Serial
  property :title, String
  property :url,   String







end
