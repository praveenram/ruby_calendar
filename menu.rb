class Menu
	def show name
		puts <<-CLI
Welcome to #{name}'s calendar
=============================
1. Add Event
2. List events
3. Add Reminder
4. Exit
		CLI

		print "Choose an option: "
	end

	def process_input
		option = gets.chomp
		option
	end
end