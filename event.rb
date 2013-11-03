class Event
	def initialize db
		@event = {}
		@db = db
	end

	def store column_name, value
		@event.store(column_name, value)
	end

	def save
		@db.insert_record "events", @event
	end
end