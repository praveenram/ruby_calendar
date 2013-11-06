require_relative "date.rb"

include DateValidator
class Event
	def initialize
		@event = {}
	end

	def store column_name, value
		@event.store(column_name, value)
	end

	def save
		if validate_date @event[:start_time] and validate_date @event[:end_time]
			db = Database.new
			db.insert_record "events", @event
		else
			p "Invalid Date format please ensure correct format."
		end
	end

	def self.all
		db = Database.new
		db.select_all "events"
	end

	def self.create_event
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

	def self.print_all
		p "id, name, start_date, end_date"
		Event.all.each do |event|
			p event
		end
	end
end