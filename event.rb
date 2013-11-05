class Event
	def initialize
		@event = {}
	end

	def store column_name, value
		@event.store(column_name, value)
	end

	def save
		db = Database.new
		db.insert_record "events", @event
	end
end