require_relative 'database.rb'
require_relative 'event.rb'
require_relative 'menu.rb'

print "Enter your name to access your own calendar: "
name = gets.chomp

db = Database.new name

menu = Menu.new
menu.show name
option = menu.process_input

if option.to_i == 1
	new_event = Event.new
	p "== New Event =="
	p "== Enter event details =="
	print "Enter event name: "
	event_name = gets.chomp
	new_event.store(:name, event_name)
	print "Enter event start time (mm/dd/yyyy hh:mm): "
	start_time = gets.chomp
	new_event.store(:start_time, start_time)
	print "Enter event end time (mm/dd/yyyy hh:mm): "
	end_time = gets.chomp
	new_event.store(:end_time, end_time)
	new_event.save
end

if option.to_i == 2
	p "id, name, start_date, end_date"
	Event.all.each do |event|
		p event
	end
end