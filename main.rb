require_relative 'database.rb'
require_relative 'event.rb'
require_relative 'menu.rb'

print "Enter your name to access your own calendar: "
name = gets.chomp

db = Database.new name

menu = Menu.new

loop do
	menu.show name
	option = menu.process_input

	if option.to_i == 1
		menu.render do Event.create_event end
	end

	if option.to_i == 2
		menu.render do Event.print_all end
	end

	if option.to_i == 3
		break
	end
end