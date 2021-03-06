require "active_record"
require "yaml"
require "pry"

require "databasics/version"
require "databasics/user"
require "databasics/address"
require "databasics/item"
require "databasics/order"

db_config = YAML.load(File.open("config/database.yml"))
ActiveRecord::Base.establish_connection(db_config)

module Databasics
	class App

		# adds a user to the database
		def user_info
			puts "What is your first name?"
			first_name=gets.chomp
			puts "What is your last name?"
			last_name=gets.chomp
			puts "What is your email?"
			email=gets.chomp
			new_user = User.new(first_name: first_name, last_name: last_name, email: email)
			new_user.save
			puts "Your id is #{new_user.id}"
		end

		# Gives the addres of a specified user
		def give_address
			puts "For which user would you like to find an address? Please input first name:"
			name1=gets.chomp
			puts "Please input last name:"
			name2=gets.chomp
			user_address = User.find_by(first_name: name1, last_name: name2)
			
			address=Address.find(user_address)

			address.each do |address|
				puts "Your current address is #{address.street}, #{address.city}, #{address.state} #{address.zip}."
			end
			
		end

		#
		#Add a method to display the items a user has ordered in the past and the number ordered.
		def display_items
			puts "What user's items would you like to view? Input user ID:"
			user_id = gets.chomp

			user=User.find(user_id)
			orders = Order.where(user_id: user.id)
			orders.each do |order|
				item=Item.find(order.item_id)
				puts "You ordered #{order.quantity} #{item.title.pluralize}"
			end
		end

		#Add a method to prompt a user for an item name and quantity and create a new order. If no such item can be found, you may tell them the order has been declined.


		def run
			# user_info
			# give_address
			display_items
		end
	end

	
  ## 3 ActiveRecord querying methods
  # 1) Model.where
  # 2) Model.find
  # 3) Model.find_by
end

app= Databasics::App.new

app.run