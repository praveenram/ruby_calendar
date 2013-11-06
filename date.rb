module DateValidator
	def validate_date date_string
		#date format: mm/dd/yyyy hh:mm
		date = date_string.split(" ")[0]
		time = date_string.split(" ")[1]
		month = date.split("/")[0].to_i
		day = date.split("/")[1].to_i
		year = date.split("/")[2].to_i
		begin
			hour = Integer(time.split(":")[0])
			mins = Integer(time.split(":")[1])
			day.between?(1,31) and month.between?(1,12) and year > 1900 and hour.between?(0,23) and mins.between?(0,59)
		rescue
			false
		end
	end
end