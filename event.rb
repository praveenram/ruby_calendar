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
end