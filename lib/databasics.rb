require "active_record"
require "yaml"
require "pry"

require "databasics/version"
require "databasics/user"
require "databasics/address"
require "databsics/item"
require "databasics/order"

db_config = YAML.load(File.open("config/database.yml"))
ActiveRecord::Base.establish_connection(db_config)

module Databasics
	class App

		def user_info
			puts "What is your first name?"
			first_name=gets.chomp
			puts "What is your last name?"
			last_name=gets.chomp
			puts "What is your email?"
			email=gets.chomp

			
		end
		# define 4 methods from hw notes
	end
  # Your code goes here...

  ## 3 ActiveRecord querying methods
  # 1) Model.where
  # 2) Model.find
  # 3) Model.find_by
end
