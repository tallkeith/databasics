require "active_record"
require "yaml"
require "pry"

require "databasics/version"
require "databasics/user"

db_config = YAML.load(File.open("config/database.yml"))
ActiveRecord::Base.establish_connection(db_config)

binding.pry

module Databasics
  # Your code goes here...
end
