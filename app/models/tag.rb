require 'data_mapper'
require 'dm-postgres-adapter'
# require_relative '../data_mapper_setup'
# require_relative 'link'

class Tag
include DataMapper::Resource
has n, :links, through: Resource
property :id, Serial
property :name, String






end
